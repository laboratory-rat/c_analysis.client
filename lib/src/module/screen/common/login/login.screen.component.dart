import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/redux/actions/login/login.challenge.actions.dart';
import 'package:c_analysis/src/route/route.dart';
import 'package:c_analysis/src/service/api/login.service.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

const Q_TOKEN = 'access_token';

@Component(
    selector: 'login-screen-component',
    templateUrl: './login.screen.component.html',
    styleUrls: ['./login.screen.component.css'],
    directives: [],
    providers: [ClassProvider(UserLocalService), ClassProvider(LoginService)])
class LoginScreenComponent extends BasicScreenComponent {
  final UserLocalService _userLocalService;
  final LoginService _loginService;

  LoginScreenComponent(StateService stateService, SnackService snackService,
      Router router, this._userLocalService, this._loginService)
      : super(stateService, snackService, router);

  String token;

  @override
  void onActivate(RouterState previous, RouterState current) {
    print('HERE');
    token = current.queryParameters[Q_TOKEN];
    if (token == null) {
      router.navigate(AppRoutePath.about.toUrl());
    } else {
      dispatch(UserChallengeAction(
          loginService: _loginService,
          snackService: snackService,
          userLocalService: _userLocalService,
          token: token));
    }
  }

  @override
  bool canActivate() => true || !_userLocalService.isAuthed;
}
