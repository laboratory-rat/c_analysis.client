import 'package:c_analysis/src/redux/actions/system/system.user.actions.dart';
import 'package:c_analysis/src/redux/state/system/system.state.dart';

SystemState systemReducer(SystemState state, action) {
  if (action is SetSystemUserAction) {
    return SystemState(locale: state.locale, user: action.user);
  }

  if (action is ClearSystemUserAction) {
    return SystemState(locale: state.locale, user: null);
  }

  return state;
}
