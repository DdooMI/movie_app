import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_consts.dart';
import 'package:movie_app/models/genres_model.dart';
import 'package:movie_app/models/slideable_model.dart';
import 'package:movie_app/models/topRated_model.dart';
import 'package:movie_app/models/upcoming_model.dart';

class ApiServices {
  static Future<SlidableModel?> popularMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.popular,
        {'language': 'en-US', 'page': '1'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.token}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return SlidableModel.fromJson(json);
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<UpcomingModel?> upcomingMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.uncoming,
        {'language': 'en-US', 'page': '1'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.token}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return UpcomingModel.fromJson(json);
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<TopRatedModel?> topRatedMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.topRated,
        {'language': 'en-US', 'page': '1'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.token}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return TopRatedModel.fromJson(json);
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<GenresModel?> genresList() async {
    var url = Uri.https(
        ApiConsts.baseUrl, ApiConsts.genresList, {'language': 'en-US'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.token}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return GenresModel.fromJson(json);
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<SlidableModel?> discoverMovie(int genreId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.discover, {
      'language': 'en-US',
      'include_adult': 'false',
      'include_video': 'false',
      'page': '1',
      'sort_by': 'popularity.desc',
      'with_genres': '$genreId'
    });
    var header = {
      'Authorization': 'Bearer ${ApiConsts.token}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return SlidableModel.fromJson(json);
    } else {
      print(response.body);
      return null;
    }
  }
}
