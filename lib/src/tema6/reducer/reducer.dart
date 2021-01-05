import 'package:first_flutter_app/src/tema6/actions/get_movies.dart';
import 'package:first_flutter_app/src/tema6/actions/search_term.dart';
import 'package:first_flutter_app/src/tema6/actions/select_movie.dart';
import 'package:first_flutter_app/src/tema6/actions/update_rating.dart';
import 'package:first_flutter_app/src/tema6/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder appStateBuilder = state.toBuilder();

  if (action is GetMoviesStart) {
    appStateBuilder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    appStateBuilder
      ..isLoading = false
      ..page = appStateBuilder.page + 1
      ..movies.addAll(action.movies);
  } else if (action is GetMoviesError) {
    appStateBuilder.isLoading = false;
  } else if (action is SearchTerm) {
    appStateBuilder
      ..movies.clear()
      ..queryTerm = action.queryTerm
      ..page = 1;
  } else if (action is UpdateRating) {
    appStateBuilder
      ..minRating = action.minRating
      ..page = 1;
  } else if (action is SelectMovie) {
    appStateBuilder.selectedMovie = action.movieId;
  }

  return appStateBuilder.build();
}
