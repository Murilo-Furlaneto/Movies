import 'package:get_it/get_it.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/navigation/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepository(getIt<ApiService>()));
}
