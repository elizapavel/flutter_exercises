import 'package:built_collection/built_collection.dart';
import 'package:first_flutter_app/src/tema5/containers/get_movies_container.dart';
import 'package:first_flutter_app/src/tema5/containers/is_loading_container.dart';
import 'package:first_flutter_app/src/tema5/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Movies'),
        ),
      ),
      body: IsLoadingContainer(
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
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        leading: Image.network(
                          movies[index].image,
                        ),
                        title: Text(movies[index].getTitle()),
                        subtitle: Text(movies[index].getShortInfo()),
                        isThreeLine: true,
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
