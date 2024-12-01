import 'package:flutter/material.dart';
import 'package:movie_app/api/api_consts.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class SlideableWidget extends StatefulWidget {
  const SlideableWidget({super.key, required this.results});

  final Results results;

  @override
  State<SlideableWidget> createState() => _SlideableWidgetState();
}

class _SlideableWidgetState extends State<SlideableWidget> {
  @override
  Widget build(BuildContext context) {
    String yearDate = widget.results.releaseDate!.substring(0, 4);
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      child: Stack(
        children: [
          Image.network(
            ApiConsts.imageUrl + widget.results.backdropPath!,
            fit: BoxFit.contain,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiConsts.imageUrl + widget.results.posterPath!),
                        fit: BoxFit.fill)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.results.originalTitle ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      yearDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w300),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
