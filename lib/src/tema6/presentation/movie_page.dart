import 'package:first_flutter_app/src/tema6/containers/get_movie_container.dart';
import 'package:first_flutter_app/src/tema6/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Movie Page'),
        ),
      ),
      body: MovieContainer(
        builder: (BuildContext context, Movie movie) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.network(movie.image),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 30,
                ),
                child: Text(
                  movie.summary,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
