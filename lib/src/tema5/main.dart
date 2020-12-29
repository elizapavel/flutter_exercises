
import 'package:first_flutter_app/src/tema5/actions/get_movies.dart';
import 'package:first_flutter_app/src/tema5/data/yts_api.dart';
import 'package:first_flutter_app/src/tema5/middleware/app_middleware.dart';
import 'package:first_flutter_app/src/tema5/models/app_state.dart';
import 'package:first_flutter_app/src/tema5/reducer/reducer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

import 'presentation/home_page.dart';

void main() {
  final Client client  = Client();
  final YtsApi ytsApi = YtsApi(client: client);
  final AppMiddleware middleware = AppMiddleware(ytsApi: ytsApi);
  final AppState initialState = AppState.initialState();
  final Store<AppState> store = Store<AppState>(
      reducer,
      initialState: initialState,
      middleware: middleware.middleware,
  );

  store.dispatch(const GetMovies());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key : key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
