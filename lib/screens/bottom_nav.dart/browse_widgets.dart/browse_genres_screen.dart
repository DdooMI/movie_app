import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/screens/bottom_nav.dart/watchList_widgets/watch_card.dart';

class BrowseGenresScreen extends StatelessWidget {
  const BrowseGenresScreen({
    super.key,
  });

  static const String routeName = "browse selected movie";
  @override
  Widget build(BuildContext context) {
    Genres genre = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  genre.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: FutureBuilder(
                    future: ApiServices.discoverMovie(genre.id ?? 1),
                    builder: (context, snapshot) {
                      SlidableModel? discoverMovies = snapshot.data;
                      List<Results> movies = discoverMovies?.results ?? [];
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return WatchCard(
                            movies: MovieModel(
                              id: movies[index].id.toString(),
                              results: movies[index],
                            ),
                          );
                        },
                        itemCount: movies.length,
                        separatorBuilder: (_, index) {
                          return Divider();
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
