import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

// data -> movies[0] -> title
// recomandare cu await - async
Future<void> main() async {
  final Response response = await get('https://yts.mx/api/v2/list_movies.json');

  final Map<String, dynamic> jsonData = jsonDecode(response.body);
  final List<dynamic> movieList = jsonData['data']['movies'];

  final List<Movie> movies =
      movieList.map((dynamic item) => Movie.fromJson(item)).toList();

  for (int i = 0; i < movies.length; i++) {
    print(movies[i]);
  }

  // print(jsonData['data']['movies'][0]['title']);
}

class Movie {
  const Movie(
      {@required this.title,
      @required this.year,
      @required this.summary,
      @required this.genres});

  Movie.fromJson(dynamic item)
      : title = item['title'],
        year = item['year'],
        summary = item['summary'],
        genres = List<String>.from(item['genres']);

  final String title;
  final int year;
  final String summary;
  final List<String> genres;

  @override
  String toString() {
    return 'Title: $title\n Year: $year\n Summary: $summary\n Genres: $genres';
  }
}
