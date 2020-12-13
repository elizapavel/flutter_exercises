import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 1;
  String _filters = '';
  List<Movie> _movies = <Movie>[];
  double _sliderValue = 9;
  String _searchValue = '';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  Future<void> loadMovies() async {
    final Response response =
        await get('https://yts.mx/api/v2/list_movies.json?limit=20&page='
            '$_currentPage$_filters');

    if (response == null) {
      _resetMovies();
      return;
    }

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (jsonData == null) {
      _resetMovies();
      return;
    }

    final List<dynamic> movieList = jsonData['data']['movies'];
    if (movieList == null || movieList.isEmpty) {
      _resetMovies();
      return;
    }

    final List<Movie> movies =
        movieList.map((dynamic item) => Movie.fromJson(item)).toList();

    setState(
      () {
        _movies.addAll(movies);
      },
    );
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              title: Column(
                children: <Widget>[
                  const Text(
                    'Filter results by:',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: Text('Search value:'),
                  ),
                  TextField(
                    onChanged: (String value) {
                      _searchValue = value;
                    },
                    controller: TextEditingController()..text = _searchValue,
                    decoration: InputDecoration(
                      hintText: 'Movie name...',
                      suffix: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text('Minimum Rating: $_sliderValue'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 9,
                      // divisions: 5,
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(
                          () {
                            _sliderValue =
                                double.parse(value.toStringAsFixed(1));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              actions: <FlatButton>[
                FlatButton(
                  child: const Text('Apply filters'),
                  onPressed: () {
                    _filters += '&query_term=$_searchValue';
                    _filters += '&minimum_rating=$_sliderValue';

                    _resetMovies();
                    loadMovies();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _resetMovies() {
    setState(
      () {
        _currentPage = 1;
        _movies = <Movie>[];
      },
    );
  }

  Widget _movieList() {
    if (_movies.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
            leading: Image.network(
              _movies[index].image,
            ),
            title: Text(_movies[index].getTitle()),
            subtitle: Text(_movies[index].getShortInfo()),
            isThreeLine: true,
          );
        },
      );
    }

    return Container(
      alignment: const Alignment(0.0, 0.0),
      child: const Text('No movies to show'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Movies'),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.pixels) {
            _currentPage++;
            loadMovies();
          }

          return true;
        },
        child: _movieList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.filter_list_alt),
      ),
    );
  }
}

class Movie {
  const Movie(
      {@required this.title,
      @required this.rating,
      @required this.summary,
      @required this.image,
      @required this.genres});

  Movie.fromJson(dynamic item)
      : title = item['title'] ?? '',
        rating = (item['rating'] ?? 0).toDouble(),
        summary = item['summary'] ?? '',
        image = item['large_cover_image'] ?? '',
        genres = List<String>.from(item['genres'] ?? <String>[]);

  final String title;
  final double rating;
  final String summary;
  final String image;
  final List<String> genres;

  String getTitle() {
    return '$rating★  $title';
  }

  String getShortInfo() {
    genres.join(' ');
    return genres.join(' ') +
        '\n\n' +
        (summary.length > 80 ? summary.substring(0, 80) + '...' : summary);
  }
}
