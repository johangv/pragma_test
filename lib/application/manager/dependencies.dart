import 'package:get_it/get_it.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_cubit.dart';
import 'package:pragma_test/data/gateways/cat_breed_repository_imp.dart';
import 'package:pragma_test/data/services/thecat_api_service.dart';
import 'package:pragma_test/domain/repositories/cat_breed_repository.dart';
import 'package:pragma_test/domain/use_cases/breedCat/get_cats_use_case.dart';
import 'package:pragma_test/domain/use_cases/breedCat/search_cats_use_case.dart';

final getIt = GetIt.instance;

void setup() async {
  //CatsBreeds
  getIt.registerFactory(() => CatBreedCubit(getIt(), getIt()));
  getIt.registerLazySingleton(() => GetCatsUseCase(getIt()));
  getIt.registerLazySingleton(() => SearchCatsUseCase(getIt()));
  getIt.registerLazySingleton<CatBreedRepository>(
    () => Catbreedrepositoryimp(getIt()),
  );
  getIt.registerLazySingleton(() => TheCatApiService());
}
