library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:first_flutter_app/src/tema5/models/movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder) updates]) {
    return _$AppState._(
      isLoading: true,
      movies: BuiltList<Movie>(),
    );
  }

  factory AppState.initialState() {
    final AppStateBuilder appStateBuilder = AppStateBuilder();
    appStateBuilder.isLoading = true;
    return appStateBuilder.build();
  }

  AppState._();

  BuiltList<Movie> get movies;

  bool get isLoading;
}
