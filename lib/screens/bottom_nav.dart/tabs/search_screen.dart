import 'package:flutter/material.dart';
import 'package:movie_app/api/api_services.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/screens/bottom_nav.dart/search_widgets/search_text_form_field_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/watchList_widgets/watch_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<MovieModel> movies = [];
  bool isSearching = false;
  bool isLoading = false;

  Future<void> onSearch(String query) async {
    if (query.isEmpty) {
      loadMovies();
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final SlidableModel? searchResults = await ApiServices.searchMovie(query);
      final List<MovieModel> searchMovies = await checkWatchlist(
        searchResults?.results ?? [],
      );

      setState(() {
        movies = searchMovies;
        isLoading = false;
        isSearching = true;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadMovies() async {
    setState(() {
      isLoading = true;
    });

    try {
      final SlidableModel? popularMovies = await ApiServices.popularMovies();
      final List<MovieModel> popularList = await checkWatchlist(
        popularMovies?.results ?? [],
      );

      setState(() {
        movies = popularList;
        isLoading = false;
        isSearching = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<List<MovieModel>> checkWatchlist(List<Results> results) async {
    List<MovieModel> movieModels = [];
    for (var result in results) {
      final bool isWatchList =
          await FirebaseServices.existMovie(result.id.toString());
      movieModels.add(MovieModel(results: result, isWatchList: isWatchList));
    }
    return movieModels;
  }

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        right: 20,
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFormFieldWidget(
            controller: controller,
            onChanged: (value) => onSearch(value),
          ),
          const SizedBox(height: 16),
          isLoading
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.gold),
                  ),
                )
              : Expanded(
                  child: movies.isEmpty
                      ? Center(
                          child: Text(
                            isSearching
                                ? "No movies found for your search."
                                : "",
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (_, index) {
                            return WatchCard(
                              movieModel: movies[index],
                            );
                          },
                          itemCount: movies.length,
                          separatorBuilder: (_, index) => const Divider(),
                        ),
                ),
        ],
      ),
    );
  }
}
