import 'package:c_analysis/src/infrastructure/response/response.ok.dart';
import 'package:c_analysis/src/redux/actions/system/system.user.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';

void systemMiddleware(Store<State> store, action) {
  if (action is SetSystemUserAction) {
    action.service.user = action.user;
  } else if (action is ClearSystemUserAction) {
    action.service.user = null;
  } else if (action is SystemCacheCheckAction) {
    if (action.localUserService.user == null) {
      store.dispatch(ClearSystemUserAction(service: action.localUserService));
    } else {
      store.dispatch(SetSystemUserAction(
          service: action.localUserService,
          user: action.localUserService.user));
      store.dispatch(SystemLoginPingAction(
          snackService: action.snackService,
          loginService: action.loginService,
          localUserService: action.localUserService));
    }
  } else if (action is SystemLoginPingAction) {
    action.loginService.ping().then((json) {
      var response = ResponseOk.fromJson(json);
      if (!response.success) {
        store.dispatch(ClearSystemUserAction(service: action.localUserService));
      }

      store.dispatch(SystemLoginPingSuccessAction());
    }).catchError((error) {
      store.dispatch(ClearSystemUserAction(service: action.localUserService));
      store.dispatch(SystemLoginPingFailAction());
    });
  }
}
