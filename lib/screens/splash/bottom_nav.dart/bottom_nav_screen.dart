import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/tabs/browse_screen.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/tabs/home_screen.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/tabs/search_screen.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/tabs/watchList_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});
  static const String routeName = "bottom nav";

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> tabs = const [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primary,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie), label: "Browse"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book_rounded), label: "Watch List")
              ]),
          body: tabs[currentIndex]),
    );
  }
}
