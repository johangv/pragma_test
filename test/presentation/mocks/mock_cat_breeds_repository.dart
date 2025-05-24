import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';

import '../../test_elements.dart';

class MockCatBreedRepository implements CatBreedRepository {
  final List<CatBreedEntity> cats = TestElements.breedCatsList;

  @override
  Future<List<CatBreedEntity>> getCats(int limit, int page) async {
    return cats;
  }

  @override
  Future<List<CatBreedEntity>> searchCats(String query) async {
    return cats;
  }
}
