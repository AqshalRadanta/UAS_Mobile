import 'dart:convert';
import 'package:prak_mobile/models/Movie.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchTv(http.Client client, String endpont) async {
  String movieUrl =
      'https://api.themoviedb.org/3/tv/';
  String tvUrl =
      '?api_key=1339d5a1cf2a0a7d65367aec6d5e4edb';
  final response = await client.get(Uri.parse(movieUrl + endpont + tvUrl));
  return compute(parseMovie, response.body);
}
List<Movie> parseMovie(String responseBody) {
  final parsed =
  jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}
