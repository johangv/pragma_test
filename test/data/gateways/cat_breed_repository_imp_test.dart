import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_test/data/gateways/cat_breed_repository_imp.dart';
import '../../test_elements.dart';
import '../mocks/mock_the_cat_api_service.dart';

void main() {
  test('getCats returns parsed list of CatBreedEntity', () async {
    final mockService = MockTheCatApiService();
    final repository = Catbreedrepositoryimp(mockService);

    mockService.mockGet((url) {
      return TestElements.breedCatsJson;
    });

    final result = await repository.getCats(3, 0);

    expect(result, isNotEmpty);
    expect(result.first.name, equals("Abyssinian"));
  });
}
