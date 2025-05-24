import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';

class GetCatsUseCase {
  final CatBreedRepository repository;

  GetCatsUseCase(this.repository);

  Future<List<CatBreedEntity>> call(int limit, int page) {
    return repository.getCats(limit, page);
  }
}
