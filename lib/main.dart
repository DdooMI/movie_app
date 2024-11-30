import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_theme.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/provider/user_provider.dart';
import 'package:movie_app/screens/bottom_nav.dart/bottom_nav_screen.dart';
import 'package:movie_app/screens/bottom_nav.dart/browse_widgets.dart/browse_genres_screen.dart';
import 'package:movie_app/screens/login_signup/login.dart';
import 'package:movie_app/screens/login_signup/signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MovieProvider>(create: (_) => MovieProvider()),
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        BottomNavScreen.routeName: (_) => const BottomNavScreen(),
        BrowseGenresScreen.routeName: (_) => const BrowseGenresScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen()
      },
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
