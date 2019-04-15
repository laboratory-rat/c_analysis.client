import 'package:c_analysis/src/redux/actions/common/snack.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';

void commonMiddleware(Store<State> store, action) {
  if (action is SnackAction) {
    action.service.emitSimple(text: action.message);
  } else if (action is SnackApiErrorAction) {
    action.service.emitSimple(text: action.message);
  }
}
