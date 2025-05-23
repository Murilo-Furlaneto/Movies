import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_constants.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/widgets/image/cached_image_widget.dart';
import 'package:movies/widgets/movies/favorite_button.dart';
import 'package:movies/widgets/movies/genre_list_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Hero(
            tag: movieModel.id,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: CachedImageWidget(
                  imgUrl:
                      "https://image.tmdb.org/t/p/w500/${movieModel.backdropPath}"),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                movieModel.title,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      "${movieModel.voteAverage.toStringAsFixed(1)}/10"),
                                  const Spacer(),
                                  Text(
                                    movieModel.releaseDate,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GenreListWidget(
                                movieModel: movieModel,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                movieModel.overview,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FavoriteButton(
                            movieModel: movieModel,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ))
        ],
      )),
    );
  }
}
