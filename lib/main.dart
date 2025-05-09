import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:movies/screens/movies_screen.dart';
import 'package:movies/screens/splash_screen.dart';
import 'package:movies/service/getIt/init_getit.dart';
import 'package:movies/service/navigation/navigation_service.dart';

void main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.ligthTheme,
      home: const SplashScreen(),
    );
  }
}
