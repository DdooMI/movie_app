import 'package:movie_app/models/slideable_model.dart';

class MovieModel {
  Results results;
  MovieModel({
    required this.results,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : this(
          results: Results.fromJson(json["results"]),
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["results"] = results.toJson();
    return data;
  }
}
