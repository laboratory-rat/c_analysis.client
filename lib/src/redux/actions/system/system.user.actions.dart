import 'package:c_analysis/src/infrastructure/user/user.model.dart';
import 'package:c_analysis/src/redux/actions/basic/loading.actions.dart';
import 'package:c_analysis/src/service/api/login.service.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

class SystemCacheCheckAction {
  final LoginService loginService;
  final UserLocalService localUserService;
  final SnackService snackService;

  SystemCacheCheckAction(
      {this.loginService, this.localUserService, this.snackService});
}

class SystemLoginPingAction extends LoadingStartAction {
  final LoginService loginService;
  final UserLocalService localUserService;
  final SnackService snackService;

  SystemLoginPingAction(
      {this.loginService, this.localUserService, this.snackService});
}

class SystemLoginPingSuccessAction extends LoadingStopAction {}

class SystemLoginPingFailAction extends LoadingStopAction {}

class SetSystemUserAction {
  final UserLocalService service;
  final UserModel user;

  SetSystemUserAction({this.service, this.user});
}

class ClearSystemUserAction {
  final UserLocalService service;

  ClearSystemUserAction({this.service});
}
