// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of update_rating;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UpdateRatingTearOff {
  const _$UpdateRatingTearOff();

// ignore: unused_element
  _UpdateRating call(double minRating) {
    return _UpdateRating(
      minRating,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UpdateRating = _$UpdateRatingTearOff();

/// @nodoc
mixin _$UpdateRating {
  double get minRating;

  $UpdateRatingCopyWith<UpdateRating> get copyWith;
}

/// @nodoc
abstract class $UpdateRatingCopyWith<$Res> {
  factory $UpdateRatingCopyWith(
          UpdateRating value, $Res Function(UpdateRating) then) =
      _$UpdateRatingCopyWithImpl<$Res>;
  $Res call({double minRating});
}

/// @nodoc
class _$UpdateRatingCopyWithImpl<$Res> implements $UpdateRatingCopyWith<$Res> {
  _$UpdateRatingCopyWithImpl(this._value, this._then);

  final UpdateRating _value;
  // ignore: unused_field
  final $Res Function(UpdateRating) _then;

  @override
  $Res call({
    Object minRating = freezed,
  }) {
    return _then(_value.copyWith(
      minRating: minRating == freezed ? _value.minRating : minRating as double,
    ));
  }
}

/// @nodoc
abstract class _$UpdateRatingCopyWith<$Res>
    implements $UpdateRatingCopyWith<$Res> {
  factory _$UpdateRatingCopyWith(
          _UpdateRating value, $Res Function(_UpdateRating) then) =
      __$UpdateRatingCopyWithImpl<$Res>;
  @override
  $Res call({double minRating});
}

/// @nodoc
class __$UpdateRatingCopyWithImpl<$Res> extends _$UpdateRatingCopyWithImpl<$Res>
    implements _$UpdateRatingCopyWith<$Res> {
  __$UpdateRatingCopyWithImpl(
      _UpdateRating _value, $Res Function(_UpdateRating) _then)
      : super(_value, (v) => _then(v as _UpdateRating));

  @override
  _UpdateRating get _value => super._value as _UpdateRating;

  @override
  $Res call({
    Object minRating = freezed,
  }) {
    return _then(_UpdateRating(
      minRating == freezed ? _value.minRating : minRating as double,
    ));
  }
}

/// @nodoc
class _$_UpdateRating implements _UpdateRating {
  const _$_UpdateRating(this.minRating) : assert(minRating != null);

  @override
  final double minRating;

  @override
  String toString() {
    return 'UpdateRating(minRating: $minRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateRating &&
            (identical(other.minRating, minRating) ||
                const DeepCollectionEquality()
                    .equals(other.minRating, minRating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(minRating);

  @override
  _$UpdateRatingCopyWith<_UpdateRating> get copyWith =>
      __$UpdateRatingCopyWithImpl<_UpdateRating>(this, _$identity);
}

abstract class _UpdateRating implements UpdateRating {
  const factory _UpdateRating(double minRating) = _$_UpdateRating;

  @override
  double get minRating;
  @override
  _$UpdateRatingCopyWith<_UpdateRating> get copyWith;
}
