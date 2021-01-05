import 'dart:convert';

import 'package:first_flutter_app/src/tema5/models/movie.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies() async {
    final Response response = await _client
        .get('https://yts.mx/api/v2/list_movies.json?limit=20&page=');

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final List<dynamic> movieList = jsonData['data']['movies'];
    return movieList.map((dynamic item) => Movie.fromJSON(item)).toList();
  }
}
