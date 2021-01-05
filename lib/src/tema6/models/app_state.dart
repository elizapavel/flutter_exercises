library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:first_flutter_app/src/tema6/models/movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initialState() {
    final AppStateBuilder appStateBuilder = AppStateBuilder();
    appStateBuilder
      ..isLoading = true
      ..page = 1
      ..queryTerm = ''
      ..minRating = 0;

    return appStateBuilder.build();
  }

  AppState._();

  BuiltList<Movie> get movies;

  int get page;

  String get queryTerm;

  double get minRating;

  bool get isLoading;

  @nullable
  int get selectedMovie;

}
