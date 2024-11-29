import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/models/topRated_model.dart';
import 'package:movie_app/models/upcoming_model.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/newRelease_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/recomended_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/home_widgets/slideable_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
            future: ApiServices.popularMovies(),
            builder: (context, snapshot) {
              SlidableModel? popularMovies = snapshot.data;
              List<Results> movies = popularMovies?.results ?? [];
              return CarouselSlider(
                  items: movies.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SlideableWidget(
                          backImage: i.backdropPath,
                          poster: i.posterPath,
                          title: i.originalTitle,
                          date: i.releaseDate,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      height: MediaQuery.of(context).size.height * 0.37));
            }),
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
              FutureBuilder(
                  future: ApiServices.upcomingMovies(),
                  builder: (context, snapshot) {
                    UpcomingModel? upcomingMovies = snapshot.data;
                    List<Results> movies = upcomingMovies?.results ?? [];
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return NewreleaseWidget(
                            poster: movies[index].posterPath,
                          );
                        },
                        itemCount: movies.length,
                      ),
                    );
                  })
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
              FutureBuilder(
                  future: ApiServices.topRatedMovies(),
                  builder: (context, snapshot) {
                    TopRatedModel? topRatedMovie = snapshot.data;
                    List<Results> movies = topRatedMovie?.results ?? [];
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return RecomendedWidget(
                            poster: movies[index].posterPath,
                            rate: movies[index].voteAverage.toString(),
                            title: movies[index].originalTitle,
                            date: movies[index].releaseDate,
                          );
                        },
                        itemCount: movies.length,
                      ),
                    );
                  })
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
