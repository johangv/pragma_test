import 'package:pragma_test/domain/entities/cat_breed_entity.dart';

abstract class CatBreedRepository {
  Future<List<CatBreedEntity>> getCats(int limit, int page);
  Future<List<CatBreedEntity>> searchCats(String query);
}
