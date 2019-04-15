import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/redux/actions/common/path.actions.dart';
import 'package:c_analysis/src/redux/actions/login/login.challenge.actions.dart';
import 'package:c_analysis/src/redux/actions/system/system.user.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:c_analysis/src/route/route.dart';
import 'package:c_analysis/src/service/api/login.service.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

@Component(
  selector: 'app-layout-component',
  templateUrl: './app.layout.component.html',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    './app.layout.component.css'
  ],
  directives: [
    coreDirectives,
    routerDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialProgressComponent,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
    NgIf
  ],
  providers: [
    ClassProvider(StateService),
    ClassProvider(SnackService),
    ClassProvider(UserLocalService),
    ClassProvider(LoginService)
  ],
  exports: [AppRoutePath, AppRoute],
)
class AppLayoutComponent extends BasicScreenComponent {
  final UserLocalService _userLocalService;
  final LoginService _loginService;

  AppLayoutComponent(StateService stateService, SnackService snackService,
      Router router, this._userLocalService, this._loginService)
      : super(stateService, snackService, router);

  @ViewChild('drawer')
  MaterialPersistentDrawerDirective drawer;

  bool isWide = false;

  void goToLogin() {
    dispatch(PathExternalRedirectAction(
        window: window,
        url: 'http://identity.madrat.studio/provider/crypto_analysis'));
  }

  logout() {
    dispatch(
        UserLogoutAction(router: router, userLocalService: _userLocalService));
  }

  @override
  void ngOnInit() {
    super.ngOnInit();
    dispatch(SystemCacheCheckAction(
        localUserService: _userLocalService,
        loginService: _loginService,
        snackService: snackService));
  }

  @override
  syncState(State state) {
    super.syncState(state);

    isWide = state.layout.isWide;

    if(!isAuthorized){
      drawer.visible = false;
    }
  }
}
