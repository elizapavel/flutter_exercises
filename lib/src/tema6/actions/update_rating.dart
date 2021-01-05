library update_rating;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_rating.freezed.dart';

@freezed
abstract class UpdateRating with _$UpdateRating {
  const factory UpdateRating(double minRating) = _UpdateRating;
}
