import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_cubit.dart';
import 'package:pragma_test/application/cubits/catBreed/states/cat_breed_cats_loaded_state.dart';
import 'package:pragma_test/application/cubits/catBreed/states/cat_breed_loading_state.dart';
import 'package:pragma_test/application/cubits/catBreed/states/cat_breed_state.dart';
import 'package:pragma_test/domain/use_cases/breedCat/get_cats_use_case.dart';
import 'package:pragma_test/domain/use_cases/breedCat/search_cats_use_case.dart';
import '../mocks/mock_cat_breeds_repository.dart';

void main() {
  late CatBreedCubit cubit;
  late GetCatsUseCase getCatsUseCase;
  late SearchCatsUseCase searchCatsUseCase;

  setUp(() {
    final MockCatBreedRepository mockCatRepository = MockCatBreedRepository();
    getCatsUseCase = GetCatsUseCase(mockCatRepository);
    searchCatsUseCase = SearchCatsUseCase(mockCatRepository);
    cubit = CatBreedCubit(getCatsUseCase, searchCatsUseCase);
  });

  test(
    'Emits [CatBreedLoading, CatsLoaded] when getInitialCats succeeds',
    () async {
      final emitted = <CatBreedState>[];

      final subscription = cubit.stream.listen(emitted.add);
      cubit.getInitialCats();
      await Future.delayed(Duration.zero);

      expect(emitted[0], isA<CatBreedLoading>());
      expect(emitted[1], isA<CatsLoaded>());

      await subscription.cancel();
    },
  );
}
