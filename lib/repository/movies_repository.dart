import 'package:movies/model/movies_genre.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/service/api_service.dart';

class MoviesRepository {
  final ApiService _apiService;
  List<MoviesGenre> cachedGenres = [];

  MoviesRepository(this._apiService);

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  Future<List<MoviesGenre>> fetchGenres({int page = 1}) async {
    return cachedGenres = await _apiService.fetchGenres(page: page);
  }
}
