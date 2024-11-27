import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_Images.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/bottom_nav_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(BottomNavScreen.routeName);
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.splash), fit: BoxFit.fill)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}