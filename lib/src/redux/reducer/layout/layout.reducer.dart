import 'package:c_analysis/src/redux/actions/basic/loading.actions.dart';
import 'package:c_analysis/src/redux/state/layout/layout.state.dart';

LayoutState layoutReducer(LayoutState state, action) {
  if (action is LoadingStartAction) {
    return LayoutState(
        loadingCounter: state.loadingCounter + 1, isWide: state.isWide);
  }
  if (action is LoadingStopAction) {
    return LayoutState(
        loadingCounter: state.loadingCounter - 1, isWide: state.isWide);
  }

  return state;
}
