import 'package:flutter/material.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/screens/movies_screen.dart';
import 'package:movies/service/getIt/init_getit.dart';
import 'package:movies/service/navigation/navigation_service.dart';
import 'package:movies/widgets/error/error_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = "";
  final _moviesRepository = getIt<MoviesRepository>();

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      await _moviesRepository.fetchGenres();
      await getIt<NavigationService>().navigateReplace(const MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading..."),
                    SizedBox(
                      height: 22,
                    ),
                    CircularProgressIndicator.adaptive()
                  ],
                ),
              )
            : ErrorWidgets(errorText: _errorMessage, retryFunction: _loadData));
  }
}
