import 'dart:convert';

import 'package:pragma_test/data/models/cat_breed_model.dart';
import 'package:pragma_test/data/services/thecat_api_service.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/domain/entities/exception_entity.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';
import 'package:pragma_test/utils/error_constants.dart';

class Catbreedrepositoryimp extends CatBreedRepository {
  final TheCatApiService theCatApiService;

  Catbreedrepositoryimp(this.theCatApiService);

  @override
  Future<List<CatBreedEntity>> getCats(int limit, int page) async {
    final String endPoint = "/breeds";
    final String params = "?limit=$limit&page=$page";

    final String relativeUrl = endPoint + params;

    try {
      final dynamic response = await theCatApiService.get(relativeUrl);
      if (response == null) {
        throw ExceptionEntity(code: ErrorConstants.errorGettingCats);
      }
      final List<dynamic> responseJson = jsonDecode(response);

      final List<CatBreedEntity> cats =
          responseJson.map((cat) => CatBreedModel.fromJson(cat)).toList();

      return cats;
    } catch (e) {
      throw ExceptionEntity.fromException(e);
    }
  }

  @override
  Future<List<CatBreedEntity>> searchCats(String query) async {
    final String endpoint = "/breeds/search";
    final String params = "?q=$query&attach_image=1";

    final String relativeUrl = endpoint + params;

    try {
      final dynamic response = await theCatApiService.get(relativeUrl);

      if (response == null) {
        throw ExceptionEntity(code: ErrorConstants.errorGettingCats);
      }
      final List<dynamic> responseJson = jsonDecode(response);

      final List<CatBreedEntity> cats =
          responseJson.map((cat) => CatBreedModel.fromJson(cat)).toList();

      return cats;
    } catch (e) {
      throw ExceptionEntity.fromException(e);
    }
  }
}
