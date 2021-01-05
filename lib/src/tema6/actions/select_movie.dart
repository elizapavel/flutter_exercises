library select_movie;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_movie.freezed.dart';

@freezed
abstract class SelectMovie with _$SelectMovie {
  const factory SelectMovie(int movieId) = _SelectMovie;
}
