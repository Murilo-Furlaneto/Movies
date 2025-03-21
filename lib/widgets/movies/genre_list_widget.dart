import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_constants.dart';

class GenreListWidget extends StatelessWidget {
  const GenreListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: 
        List.generate(
            MyAppConstants.genres.length,
            (index) => chipWidget(
                genreName: MyAppConstants.genres[index], context: context)));
  }

  Widget chipWidget(
      {required String genreName, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
