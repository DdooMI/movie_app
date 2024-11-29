import 'package:movie_app/models/slideable_model.dart';

class TopRatedModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TopRatedModel({this.page, this.results, this.totalPages, this.totalResults});

  TopRatedModel.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
  }

  static List<TopRatedModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopRatedModel.fromJson).toList();
  }
}
