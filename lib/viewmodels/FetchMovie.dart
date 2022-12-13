import 'dart:convert';
import 'package:prak_mobile/models/Movie.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovie(http.Client client, String endpont) async {
  String MovieUrl =
      'https://api.themoviedb.org/3/movie/';
  String MovieUrl2 =
      '?api_key=1339d5a1cf2a0a7d65367aec6d5e4edb';
  final response = await client.get(Uri.parse(MovieUrl + endpont + MovieUrl2));
  return compute(parseMovie, response.body);
}

List<Movie> parseMovie(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}
