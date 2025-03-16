import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';
import 'package:movies/widgets/movies/movies_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                MyAppIcons.delete,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const Text("data"); //const MoviesWidget();
        },
      ),
    );
  }
}
