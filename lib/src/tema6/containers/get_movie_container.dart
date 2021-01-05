import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:first_flutter_app/src/tema6/models/app_state.dart';
import 'package:first_flutter_app/src/tema6/models/movie.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Movie> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) {
        return store.state.movies
            .firstWhere((Movie movie) => movie.id == store.state.selectedMovie);
      },
      builder: builder,
    );
  }
}
