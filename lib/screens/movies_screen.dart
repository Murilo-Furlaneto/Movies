import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/constants/my_app_constants.dart';
import 'package:movies/constants/my_app_icons.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/screens/favorite_screen.dart';
import 'package:movies/service/api/api_service.dart';
import 'package:movies/service/getIt/init_getit.dart';
import 'package:movies/service/navigation/navigation_service.dart';
import 'package:movies/view_models/theme_provider.dart';
import 'package:movies/widgets/image/cached_image_widget.dart';
import 'package:movies/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;
    });

    try {
      final List<MovieModel> movies =
          await getIt<MoviesRepository>().fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      getIt<NavigationService>()
          .showSnackBar("An error has been occured $error");
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
              onPressed: () {
                getIt<NavigationService>().navigate(const FavoriteScreen());
              },
              icon: const Icon(
                MyAppIcons.favoriteRounded,
                color: Colors.red,
              )),
          IconButton(
            onPressed: () async {
              themeProvider.toggleTheme();
              /*   final List<MovieModel> movies =
                  await getIt<MoviesRepository>().fetchMovies();
              log("Movies screens - movies: $movies"); */
            },
            icon: const Icon(
              MyAppIcons.darkMode,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index < _movies.length) {
            return MoviesWidget(movieModel: _movies[index]);
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
