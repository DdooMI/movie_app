import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/screens/bottom_nav.dart/tabs/browse_screen.dart';
import 'package:movie_app/screens/bottom_nav.dart/tabs/home_screen.dart';
import 'package:movie_app/screens/bottom_nav.dart/tabs/search_screen.dart';
import 'package:movie_app/screens/bottom_nav.dart/tabs/settings_tab.dart';
import 'package:movie_app/screens/bottom_nav.dart/tabs/watchList_screen.dart';

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
    WatchlistScreen(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primary,
          bottomNavigationBar: Container(
            color: AppColors.secondary,
            child: BottomNavigationBar(
                backgroundColor: AppColors.secondary,
                onTap: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: AppLocalizations.of(context)!.home,
                    backgroundColor: AppColors.secondary,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: AppLocalizations.of(context)!.search,
                    backgroundColor: AppColors.secondary,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.movie),
                    label: AppLocalizations.of(context)!.browse,
                    backgroundColor: AppColors.secondary,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_rounded),
                    label: AppLocalizations.of(context)!.watchList,
                    backgroundColor: AppColors.secondary,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                    backgroundColor: AppColors.secondary,
                  )
                ]),
          ),
          body: tabs[currentIndex]),
    );
  }
}
