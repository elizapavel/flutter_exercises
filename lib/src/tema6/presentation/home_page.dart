import 'package:built_collection/built_collection.dart';
import 'package:first_flutter_app/src/tema6/actions/get_movies.dart';
import 'package:first_flutter_app/src/tema6/actions/search_term.dart';
import 'package:first_flutter_app/src/tema6/actions/select_movie.dart';
import 'package:first_flutter_app/src/tema6/actions/update_rating.dart';
import 'package:first_flutter_app/src/tema6/containers/get_movies_container.dart';
import 'package:first_flutter_app/src/tema6/containers/is_loading_container.dart';
import 'package:first_flutter_app/src/tema6/containers/search_term_container.dart';
import 'package:first_flutter_app/src/tema6/containers/update_rating_container.dart';
import 'package:first_flutter_app/src/tema6/models/app_state.dart';
import 'package:first_flutter_app/src/tema6/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _movieList() {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return Builder(
          builder: (BuildContext context) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return MoviesContainer(
              builder: (BuildContext context, BuiltList<Movie> movies) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Movie movie = movies[index];
                    return InkWell(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(SelectMovie(movie.id));
                        Navigator.pushNamed(context, '/moviePage');
                      },
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        leading: Image.network(
                          movie.image,
                        ),
                        title: Text(movie.getTitle()),
                        subtitle: Text(movie.getShortInfo()),
                        isThreeLine: true,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return UpdateRatingContainer(
          builder: (BuildContext context, double minRating) {
            return SearchTermContainer(
              builder: (BuildContext context, String queryTerm) {
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
                          queryTerm = value;
                        },
                        controller: TextEditingController()..text = queryTerm,
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
                        child: Text('Minimum Rating: $minRating'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Slider(
                          value: minRating,
                          min: 0,
                          max: 9,
                          label: minRating.round().toString(),
                          onChanged: (double value) {
                            minRating = double.parse(value.toStringAsFixed(1));
                            StoreProvider.of<AppState>(context)
                                .dispatch(UpdateRating(minRating));
                          },
                        ),
                      ),
                    ],
                  ),
                  actions: <FlatButton>[
                    FlatButton(
                      child: const Text('Apply filters'),
                      onPressed: () {
                        if (queryTerm.isNotEmpty || minRating > 0) {
                          StoreProvider.of<AppState>(context)
                            ..dispatch(SearchTerm(queryTerm))
                            ..dispatch(const GetMovies());
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
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
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            StoreProvider.of<AppState>(context).dispatch(const GetMovies());
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
