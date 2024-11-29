import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/movie_details_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/recomended_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ListView(
        children: [
          MovieDetailsWidget(),
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
                    "More Like This",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return RecomendedWidget(
                        poster: '',
                        rate: '',
                        title: '',
                        date: '',
                      );
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
