import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/use_cases/breedCat/get_cats_use_case.dart';
import '../mocks/mock_cat_repository.dart';

void main() {
  late GetCatsUseCase getCatsUseCase;
  late MockCatRepository mockCatRepository;

  setUp(() {
    mockCatRepository = MockCatRepository();
    getCatsUseCase = GetCatsUseCase(mockCatRepository);
  });

  test('should return list of CatBreedEntity from repository', () async {
    final result = await getCatsUseCase(2, 0);

    expect(result, isA<List<CatBreedEntity>>());
    expect(result.length, 2);
    expect(result.first.name, "Abyssinian");
  });
}
