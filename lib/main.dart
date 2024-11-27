import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_theme.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/bottom_nav_screen.dart';
import 'package:movie_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {BottomNavScreen.routeName: (_) => const BottomNavScreen()},
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}
