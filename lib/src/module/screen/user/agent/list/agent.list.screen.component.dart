import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/src/router/router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

@Component(
    selector: 'agent-list-screen-component',
    templateUrl: './agent.list.screen.component.html',
    styleUrls: ['./agent.list.screen.component.css'],
    directives: [MaterialButtonComponent, MaterialIconComponent])
class AgentListScreenComponent extends BasicScreenComponent {
  AgentListScreenComponent(
      StateService stateService, SnackService snackService, Router router)
      : super(stateService, snackService, router);

  void goToCreate() => router.navigate('/agent/create');

  @override
  bool canActivate() => stateService.store.state.system.isAuthorized;
}
