import 'package:pragma_test/application/cubits/catBreed/states/cat_breed_state.dart';

class CatBreedError extends CatBreedState {
  final String message;

  const CatBreedError({required this.message});
}
