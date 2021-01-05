// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final int page;
  @override
  final String queryTerm;
  @override
  final double minRating;
  @override
  final bool isLoading;
  @override
  final int selectedMovie;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.movies,
      this.page,
      this.queryTerm,
      this.minRating,
      this.isLoading,
      this.selectedMovie})
      : super._() {
    if (movies == null) {
      throw new BuiltValueNullFieldError('AppState', 'movies');
    }
    if (page == null) {
      throw new BuiltValueNullFieldError('AppState', 'page');
    }
    if (queryTerm == null) {
      throw new BuiltValueNullFieldError('AppState', 'queryTerm');
    }
    if (minRating == null) {
      throw new BuiltValueNullFieldError('AppState', 'minRating');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        page == other.page &&
        queryTerm == other.queryTerm &&
        minRating == other.minRating &&
        isLoading == other.isLoading &&
        selectedMovie == other.selectedMovie;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, movies.hashCode), page.hashCode),
                    queryTerm.hashCode),
                minRating.hashCode),
            isLoading.hashCode),
        selectedMovie.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('movies', movies)
          ..add('page', page)
          ..add('queryTerm', queryTerm)
          ..add('minRating', minRating)
          ..add('isLoading', isLoading)
          ..add('selectedMovie', selectedMovie))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Movie> _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie> movies) => _$this._movies = movies;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  String _queryTerm;
  String get queryTerm => _$this._queryTerm;
  set queryTerm(String queryTerm) => _$this._queryTerm = queryTerm;

  double _minRating;
  double get minRating => _$this._minRating;
  set minRating(double minRating) => _$this._minRating = minRating;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  int _selectedMovie;
  int get selectedMovie => _$this._selectedMovie;
  set selectedMovie(int selectedMovie) => _$this._selectedMovie = selectedMovie;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _movies = _$v.movies?.toBuilder();
      _page = _$v.page;
      _queryTerm = _$v.queryTerm;
      _minRating = _$v.minRating;
      _isLoading = _$v.isLoading;
      _selectedMovie = _$v.selectedMovie;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              page: page,
              queryTerm: queryTerm,
              minRating: minRating,
              isLoading: isLoading,
              selectedMovie: selectedMovie);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
