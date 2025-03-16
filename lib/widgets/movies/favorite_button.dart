import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //TODO: Implement add to favorite
      },
      icon: const Icon(
        MyAppIcons.favoriteRoundedOutline,
        // color: Colors.red,
        size: 20.0,
      ),
    );
  }
}
