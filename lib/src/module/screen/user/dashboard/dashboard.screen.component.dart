import 'package:angular/angular.dart';
import 'package:angular_router/src/router/router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

@Component(
    selector: 'dashboard-screen-component',
    templateUrl: './dashboard.screen.component.html',
    styleUrls: ['./dashboard.screen.component.css'])
class DashboardScreenComponent extends BasicScreenComponent {
  DashboardScreenComponent(
      StateService stateService, SnackService snackService, Router router)
      : super(stateService, snackService, router);

  @override
  bool canActivate() => stateService.store.state.system.isAuthorized;
}
