import 'package:flutter/material.dart';
import 'package:movie_app/api/api_consts.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class WatchCard extends StatefulWidget {
  const WatchCard({super.key, required this.results});
  final Results results;

  @override
  State<WatchCard> createState() => _WatchCardState();
}

class _WatchCardState extends State<WatchCard> {
  @override
  Widget build(BuildContext context) {
    String yearDate = widget.results.releaseDate!.substring(0, 4);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 100,
      color: AppColors.primary,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        ApiConsts.imageUrl + widget.results.posterPath!),
                    fit: BoxFit.cover)),
            child: GestureDetector(
              onTap: () async {
                Results updateResults = widget.results.copyWith(
                    results: Results(isWatch: !(widget.results.isWatch!)));
                if (updateResults.isWatch!) {
                  Provider.of<MovieProvider>(context)
                      .deleteMovie(MovieModel(results: updateResults));
                } else {
                  Provider.of<MovieProvider>(context)
                      .addMovie(MovieModel(results: updateResults));
                }
              },
              child: widget.results.isWatch!
                  ? Image.asset("assets/bookmark.png")
                  : Image.asset("assets/notbookmark.png"),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.results.originalTitle ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    yearDate,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.gold,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.results.voteAverage.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
