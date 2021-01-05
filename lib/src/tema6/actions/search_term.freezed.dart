// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of search_term;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchTermTearOff {
  const _$SearchTermTearOff();

// ignore: unused_element
  _SearchTerm call(String queryTerm) {
    return _SearchTerm(
      queryTerm,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchTerm = _$SearchTermTearOff();

/// @nodoc
mixin _$SearchTerm {
  String get queryTerm;

  $SearchTermCopyWith<SearchTerm> get copyWith;
}

/// @nodoc
abstract class $SearchTermCopyWith<$Res> {
  factory $SearchTermCopyWith(SearchTerm value, $Res Function(SearchTerm) then) = _$SearchTermCopyWithImpl<$Res>;
  $Res call({String queryTerm});
}

/// @nodoc
class _$SearchTermCopyWithImpl<$Res> implements $SearchTermCopyWith<$Res> {
  _$SearchTermCopyWithImpl(this._value, this._then);

  final SearchTerm _value;
  // ignore: unused_field
  final $Res Function(SearchTerm) _then;

  @override
  $Res call({
    Object queryTerm = freezed,
  }) {
    return _then(_value.copyWith(
      queryTerm: queryTerm == freezed ? _value.queryTerm : queryTerm as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchTermCopyWith<$Res> implements $SearchTermCopyWith<$Res> {
  factory _$SearchTermCopyWith(_SearchTerm value, $Res Function(_SearchTerm) then) = __$SearchTermCopyWithImpl<$Res>;
  @override
  $Res call({String queryTerm});
}

/// @nodoc
class __$SearchTermCopyWithImpl<$Res> extends _$SearchTermCopyWithImpl<$Res> implements _$SearchTermCopyWith<$Res> {
  __$SearchTermCopyWithImpl(_SearchTerm _value, $Res Function(_SearchTerm) _then)
      : super(_value, (v) => _then(v as _SearchTerm));

  @override
  _SearchTerm get _value => super._value as _SearchTerm;

  @override
  $Res call({
    Object queryTerm = freezed,
  }) {
    return _then(_SearchTerm(
      queryTerm == freezed ? _value.queryTerm : queryTerm as String,
    ));
  }
}

/// @nodoc
class _$_SearchTerm implements _SearchTerm {
  const _$_SearchTerm(this.queryTerm) : assert(queryTerm != null);

  @override
  final String queryTerm;

  @override
  String toString() {
    return 'SearchTerm(queryTerm: $queryTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchTerm &&
            (identical(other.queryTerm, queryTerm) ||
                const DeepCollectionEquality().equals(other.queryTerm, queryTerm)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(queryTerm);

  @override
  _$SearchTermCopyWith<_SearchTerm> get copyWith => __$SearchTermCopyWithImpl<_SearchTerm>(this, _$identity);
}

abstract class _SearchTerm implements SearchTerm {
  const factory _SearchTerm(String queryTerm) = _$_SearchTerm;

  @override
  String get queryTerm;
  @override
  _$SearchTermCopyWith<_SearchTerm> get copyWith;
}
