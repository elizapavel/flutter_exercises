library search_term;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_term.freezed.dart';

@freezed
abstract class SearchTerm with _$SearchTerm {
  const factory SearchTerm(String queryTerm) = _SearchTerm;
}
