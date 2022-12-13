import 'package:flutter/material.dart';
import 'package:prak_mobile/models/Movie.dart';
import 'package:prak_mobile/view/DetailTv.dart';

class Tvlist extends StatelessWidget {
  final List<Movie> movie;

  const Tvlist({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: movie.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailTv(
                          movie: movie[index],
                        )));
          },
          child: Card(
            elevation: 4.0,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  // leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(
                    movie[index].name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    movie[index].language,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(
                    image: NetworkImage('https://image.tmdb.org/t/p/original' +
                        movie[index].picture),
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie[index].overview,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
