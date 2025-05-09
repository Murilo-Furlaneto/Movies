import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';
import 'package:movies/model/movies_model.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final favoriteMoviesid = [];

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteMoviesid.contains(widget.movieModel.id);  

    return IconButton(
      onPressed: () {
        setState(() {
          if (isFavorite) {
            favoriteMoviesid.remove(widget.movieModel.id);
          } else {
            favoriteMoviesid.add(widget.movieModel.id);
          }
        });
      },
      icon: Icon(
        isFavorite ? MyAppIcons.favoriteRounded : MyAppIcons.favoriteRoundedOutline,
        color: isFavorite ? Colors.red : null,
        size: 20.0,
      ),
    );
  }
}
