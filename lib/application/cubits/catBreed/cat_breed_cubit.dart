import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_state.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/use_cases/breedCat/get_cats_use_case.dart';
import 'package:pragma_test/domain/use_cases/breedCat/search_cats_use_case.dart';

class CatBreedCubit extends Cubit<CatBreedState> {
  CatBreedCubit(this._getCatsUseCase, this._searchCatsUseCase)
    : super(CatBreedInitial());

  final GetCatsUseCase _getCatsUseCase;
  final SearchCatsUseCase _searchCatsUseCase;

  int _currentPage = 0;
  final int _limit = 10;
  bool _isFetching = false;
  Timer? _debounce;

  void getInitialCats() async {
    emit(CatBreedLoading());

    _currentPage = 0;

    try {
      final List<CatBreedEntity> cats = await _getCatsUseCase(
        _limit,
        _currentPage,
      );
      emit(CatsLoaded(cats: cats, hasReachedEnd: cats.length < _limit));
    } catch (e) {
      emit(CatBreedError(message: e.toString()));
    }
  }

  void getMoreCats() async {
    if (_isFetching || state is! CatsLoaded) return;

    _isFetching = true;
    _currentPage++;

    final currentState = state as CatsLoaded;

    try {
      final cats = await _getCatsUseCase(_limit, _currentPage);
      final allCats = [...currentState.cats, ...cats];
      emit(CatsLoaded(cats: allCats, hasReachedEnd: cats.length < _limit));
    } catch (e) {
      emit(CatBreedError(message: e.toString()));
    }

    _isFetching = false;
  }

  void searchCats(String query) async {
    try {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        emit(CatBreedLoading());
        final List<CatBreedEntity> cats = await _searchCatsUseCase(query);
        emit(CatsLoaded(cats: cats, hasReachedEnd: true));
      });
    } catch (e) {
      emit(CatBreedError(message: e.toString()));
    }
  }
}
