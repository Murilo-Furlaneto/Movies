import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_constants.dart';
import 'package:movies/constants/my_app_icons.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/service/getIt/init_getit.dart';
import 'package:movies/service/navigation/navigation_service.dart';
import 'package:movies/widgets/image/cached_image_widget.dart';
import 'package:movies/widgets/movies/favorite_button.dart';
import 'package:movies/widgets/movies/genre_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            getIt<NavigationService>().navigate(MovieDetailsScreen(
              movieModel: movieModel,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: movieModel.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox(
                        height: 130,
                        width: 95,
                        child: CachedImageWidget(
                            imgUrl:
                                "https://image.tmdb.org/t/p/w500/${movieModel.backdropPath}"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.title,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              "${movieModel.voteAverage.toStringAsFixed(1)}/10"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GenreListWidget(
                        movieModel: movieModel,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            MyAppIcons.watchLaterOutlined,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            movieModel.releaseDate,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const Spacer(),
                          FavoriteButton(
                            movieModel: movieModel,
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
