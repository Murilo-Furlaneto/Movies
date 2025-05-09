import 'package:movies/model/movies_genre.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/service/getIt/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> moviesGenresNames(List<int> genreIds) {
    final moviesrepository = getIt<MoviesRepository>();
    final cachedGenres = moviesrepository.cachedGenres;
    List<MoviesGenre> genreNames = [];

    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere((g) => g.id == genreId,
          orElse: () => MoviesGenre(id: 5448484, name: 'Unknow'));

      genreNames.add(genre);
    }
    return genreNames;
  }
}
