import 'package:first_flutter_app/src/tema5/actions/get_movies.dart';
import 'package:first_flutter_app/src/tema5/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  final AppStateBuilder appStateBuilder = AppStateBuilder();

  if (action is GetMovies) {
    appStateBuilder.isLoading = true;
  } else if (action is GetMoviesSuccessful) {
    appStateBuilder.isLoading = false;
    appStateBuilder.movies.addAll(action.movies);
  } else if (action is GetMoviesError) {
    appStateBuilder.isLoading = false;
  }

  return appStateBuilder.build();
}
