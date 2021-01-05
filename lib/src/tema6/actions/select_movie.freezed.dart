// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of select_movie;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SelectMovieTearOff {
  const _$SelectMovieTearOff();

// ignore: unused_element
  _SelectMovie call(int movieId) {
    return _SelectMovie(
      movieId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SelectMovie = _$SelectMovieTearOff();

/// @nodoc
mixin _$SelectMovie {
  int get movieId;

  $SelectMovieCopyWith<SelectMovie> get copyWith;
}

/// @nodoc
abstract class $SelectMovieCopyWith<$Res> {
  factory $SelectMovieCopyWith(
          SelectMovie value, $Res Function(SelectMovie) then) =
      _$SelectMovieCopyWithImpl<$Res>;
  $Res call({int movieId});
}

/// @nodoc
class _$SelectMovieCopyWithImpl<$Res> implements $SelectMovieCopyWith<$Res> {
  _$SelectMovieCopyWithImpl(this._value, this._then);

  final SelectMovie _value;
  // ignore: unused_field
  final $Res Function(SelectMovie) _then;

  @override
  $Res call({
    Object movieId = freezed,
  }) {
    return _then(_value.copyWith(
      movieId: movieId == freezed ? _value.movieId : movieId as int,
    ));
  }
}

/// @nodoc
abstract class _$SelectMovieCopyWith<$Res>
    implements $SelectMovieCopyWith<$Res> {
  factory _$SelectMovieCopyWith(
          _SelectMovie value, $Res Function(_SelectMovie) then) =
      __$SelectMovieCopyWithImpl<$Res>;
  @override
  $Res call({int movieId});
}

/// @nodoc
class __$SelectMovieCopyWithImpl<$Res> extends _$SelectMovieCopyWithImpl<$Res>
    implements _$SelectMovieCopyWith<$Res> {
  __$SelectMovieCopyWithImpl(
      _SelectMovie _value, $Res Function(_SelectMovie) _then)
      : super(_value, (v) => _then(v as _SelectMovie));

  @override
  _SelectMovie get _value => super._value as _SelectMovie;

  @override
  $Res call({
    Object movieId = freezed,
  }) {
    return _then(_SelectMovie(
      movieId == freezed ? _value.movieId : movieId as int,
    ));
  }
}

/// @nodoc
class _$_SelectMovie implements _SelectMovie {
  const _$_SelectMovie(this.movieId) : assert(movieId != null);

  @override
  final int movieId;

  @override
  String toString() {
    return 'SelectMovie(movieId: $movieId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectMovie &&
            (identical(other.movieId, movieId) ||
                const DeepCollectionEquality().equals(other.movieId, movieId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(movieId);

  @override
  _$SelectMovieCopyWith<_SelectMovie> get copyWith =>
      __$SelectMovieCopyWithImpl<_SelectMovie>(this, _$identity);
}

abstract class _SelectMovie implements SelectMovie {
  const factory _SelectMovie(int movieId) = _$_SelectMovie;

  @override
  int get movieId;
  @override
  _$SelectMovieCopyWith<_SelectMovie> get copyWith;
}
