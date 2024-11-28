import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/newRelease_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/recomended_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/slideable_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SlideableWidget(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: AppColors.greydark,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
              right: 10,
              left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "New Releases",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return NewreleaseWidget();
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: AppColors.greydark,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
              right: 10,
              left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Recomended",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return RecomendedWidget();
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
