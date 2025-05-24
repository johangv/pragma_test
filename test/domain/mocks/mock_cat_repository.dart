import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';

import '../../test_elements.dart';

class MockCatRepository implements CatBreedRepository {
  final List<CatBreedEntity> cats = TestElements.breedCatsList;

  @override
  Future<List<CatBreedEntity>> getCats(int limit, int page) async {
    late int newLimit;
    late int start;
    if (page == 0) {
      newLimit = limit;
      start = 0;
    } else {
      newLimit = limit * page + limit;
      start = limit * page + 1;
    }
    page == 0 ? newLimit = limit : newLimit = limit * page + 1;

    List<CatBreedEntity> paginatorCats = cats.sublist(start, newLimit);

    return paginatorCats;
  }

  @override
  Future<List<CatBreedEntity>> searchCats(String query) async {
    return cats;
  }
}
