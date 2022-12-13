import 'package:flutter/material.dart';
import 'package:prak_mobile/models/Movie.dart';
import 'package:prak_mobile/view/MovieList.dart';
import 'package:prak_mobile/view/Tvlist.dart';
import 'package:prak_mobile/viewmodels/FetchMovie.dart';
import 'package:http/http.dart' as http;
import 'package:prak_mobile/viewmodels/FetchTv.dart';

class tvScreen extends StatelessWidget {
  const tvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Movie>>(
              future: fetchTv(http.Client(), 'popular'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Tvlist(movie: snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              },
            )
    );
  }
}
