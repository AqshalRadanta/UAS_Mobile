import 'package:flutter/material.dart';
import 'package:prak_mobile/models/Movie.dart';
import 'package:prak_mobile/view/Home.dart';

class DetailMovie extends StatelessWidget {
  final Movie movie;

  DetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 203, 71),
                            ),
                            Text('  ' + movie.rate),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    movie.language,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'release : ' + movie.publish,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    Widget bagianDeskripsi = Container(
      padding: EdgeInsets.only(
        top: 8,
        right: 16,
        left: 16,
        bottom: 32,
      ),
      child: Text(
        movie.overview,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 400,
            child: Image.network(
              'https://image.tmdb.org/t/p/original' + movie.picture,
              fit: BoxFit.fill,
            ),
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}
