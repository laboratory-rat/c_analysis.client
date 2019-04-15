import 'package:c_analysis/src/infrastructure/user/user.model.dart';
import 'package:c_analysis/src/redux/actions/common/path.actions.dart';
import 'package:c_analysis/src/redux/actions/common/snack.actions.dart';
import 'package:c_analysis/src/redux/actions/login/login.challenge.actions.dart';
import 'package:c_analysis/src/redux/actions/system/system.user.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';

void loginChallengeMiddleware(Store<State> store, action) {
  if (action is UserChallengeAction) {
    action.loginService.approveLogin(action.token).then((json) {
      var user = UserModel.fromJson(json);
      store.dispatch(
          SetSystemUserAction(user: user, service: action.userLocalService));
      store.dispatch(UserChallengeSuccessAction(
          user: user, userLocalService: action.userLocalService));
    }).catchError((error) {
      store.dispatch(
          SnackAction(message: 'Login failed', service: action.snackService));
      store.dispatch(UserChallengeFailAction());
    });
  } else if (action is UserLogoutAction) {
    store.dispatch(ClearSystemUserAction(service: action.userLocalService));
    store.dispatch(PathNavigateAction(router: action.router, path: '/'));
  }
}
