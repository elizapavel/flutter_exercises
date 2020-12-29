// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object> serialize(Serializers serializers, Movie object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(double)),
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.image, specifiedType: const FullType(String)),
      'genres',
      serializers.serialize(object.genres, specifiedType: const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value, specifiedType: const FullType(double)) as double;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'large_cover_image':
          result.image = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [const FullType(String)])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String title;
  @override
  final double rating;
  @override
  final String summary;
  @override
  final String image;
  @override
  final BuiltList<String> genres;

  factory _$Movie([void Function(MovieBuilder) updates]) => (new MovieBuilder()..update(updates)).build();

  _$Movie._({this.title, this.rating, this.summary, this.image, this.genres}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Movie', 'title');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('Movie', 'rating');
    }
    if (summary == null) {
      throw new BuiltValueNullFieldError('Movie', 'summary');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('Movie', 'image');
    }
    if (genres == null) {
      throw new BuiltValueNullFieldError('Movie', 'genres');
    }
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        title == other.title &&
        rating == other.rating &&
        summary == other.summary &&
        image == other.image &&
        genres == other.genres;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc($jc($jc(0, title.hashCode), rating.hashCode), summary.hashCode), image.hashCode), genres.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('title', title)
          ..add('rating', rating)
          ..add('summary', summary)
          ..add('image', image)
          ..add('genres', genres))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  String _summary;
  String get summary => _$this._summary;
  set summary(String summary) => _$this._summary = summary;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  ListBuilder<String> _genres;
  ListBuilder<String> get genres => _$this._genres ??= new ListBuilder<String>();
  set genres(ListBuilder<String> genres) => _$this._genres = genres;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _rating = _$v.rating;
      _summary = _$v.summary;
      _image = _$v.image;
      _genres = _$v.genres?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result =
          _$v ?? new _$Movie._(title: title, rating: rating, summary: summary, image: image, genres: genres.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genres';
        genres.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
