import 'package:c_analysis/src/redux/actions/common/path.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';

void pathMiddleware(Store<State> store, action) {
  if (action is PathExternalRedirectAction) {
    action.window.location.href = action.url;
  } else if (action is PathNavigateAction){
    action.router.navigate(action.path);
  }
}
