import 'dart:convert';

import 'package:first_flutter_app/src/tema6/models/movie.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies(
      int page, String queryTerm, double minRating) async {
    final Uri url = Uri(scheme: 'https', host: 'yts.mx', pathSegments: <String>[
      'api',
      'v2',
      'list_movies.json'
    ], queryParameters: <String, String>{
      'limit': '10',
      'page': '$page',
      'query_term': '$queryTerm',
      'minimum_rating': '$minRating',
    });

    final Response response = await _client.get(url);

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final List<dynamic> movieList = jsonData['data']['movies'];
    return movieList.map((dynamic item) => Movie.fromJSON(item)).toList();
  }
}
