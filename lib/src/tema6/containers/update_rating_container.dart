import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:first_flutter_app/src/tema6/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

class UpdateRatingContainer extends StatelessWidget {
  const UpdateRatingContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<double> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, double>(
      converter: (Store<AppState> store) {
        return store.state.minRating;
      },
      builder: builder,
    );
  }

}