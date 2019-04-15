import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/infrastructure/user/user.model.dart';
import 'package:c_analysis/src/redux/actions/basic/loading.actions.dart';
import 'package:c_analysis/src/service/api/login.service.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

class UserChallengeAction extends LoadingStartAction {
  final UserLocalService userLocalService;
  final SnackService snackService;
  final LoginService loginService;
  final String token;

  UserChallengeAction(
      {this.userLocalService,
      this.snackService,
      this.loginService,
      this.token});
}

class UserChallengeSuccessAction extends LoadingStopAction {
  final UserModel user;
  final UserLocalService userLocalService;

  UserChallengeSuccessAction({this.user, this.userLocalService});
}

class UserChallengeFailAction extends LoadingStopAction {}

class UserLogoutAction {
  final UserLocalService userLocalService;
  final Router router;

  UserLogoutAction({this.userLocalService, this.router});
}
