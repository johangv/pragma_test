import 'package:pragma_test/domain/entities/cat_breed_entity.dart';

abstract class CatBreedState {
  const CatBreedState();
}

class CatBreedInitial extends CatBreedState {
  const CatBreedInitial();
}

class CatBreedLoading extends CatBreedState {
  const CatBreedLoading();
}

class CatsLoaded extends CatBreedState {
  final List<CatBreedEntity> cats;
  final bool hasReachedEnd;

  const CatsLoaded({required this.cats, required this.hasReachedEnd});
}

class CatBreedError extends CatBreedState {
  final String message;

  const CatBreedError({required this.message});
}
