import 'package:flutter/material.dart';
import 'package:prak_mobile/models/Movie.dart';
import 'package:prak_mobile/view/MovieList.dart';
import 'package:prak_mobile/viewmodels/FetchMovie.dart';
import 'package:http/http.dart' as http;

class Playing extends StatelessWidget {
  const Playing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Movie>>(
        future: fetchMovie(http.Client(), 'now_playing'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? MovieList(movie: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
