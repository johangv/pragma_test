import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';

class SearchCatsUseCase {
  final CatBreedRepository repository;

  SearchCatsUseCase(this.repository);

  Future<List<CatBreedEntity>> call(String query) {
    return repository.searchCats(query);
  }
}
