library movie;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/src/tema5/models/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;

  factory Movie.fromJSON(dynamic json) {
    return serializers.deserializeWith(serializer, json);
  }

  Movie._();

  String get title;

  double get rating;

  String get summary;

  @BuiltValueField(wireName: 'large_cover_image')
  String get image;

  BuiltList<String> get genres;

  static Serializer<Movie> get serializer => _$movieSerializer;

  String getTitle() {
    return '$rating★  $title';
  }

  String getShortInfo() {
    return genres.join(' ') + '\n\n' + (summary.length > 80 ? summary.substring(0, 80) + '...' : summary);
  }
}