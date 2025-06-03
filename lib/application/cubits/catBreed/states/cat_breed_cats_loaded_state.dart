import 'package:pragma_test/application/cubits/catBreed/states/cat_breed_state.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';

class CatsLoaded extends CatBreedState {
  final List<CatBreedEntity> cats;
  final bool hasReachedEnd;

  const CatsLoaded({required this.cats, required this.hasReachedEnd});
}
