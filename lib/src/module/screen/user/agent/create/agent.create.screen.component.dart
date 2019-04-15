import 'package:angular/angular.dart';
import 'package:angular_router/src/router/router.dart';
import 'package:c_analysis/src/module/component/chart-agent/chart.agent.component.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

@Component(
    selector: 'agent-create-screen-component',
    templateUrl: './agent.create.screen.component.html',
    styleUrls: ['./agent.create.screen.component.css'],
    directives: [ChartAgentComponent])
class AgentCreateScreenComponent extends BasicScreenComponent {
  AgentCreateScreenComponent(
      StateService stateService, SnackService snackService, Router router)
      : super(stateService, snackService, router);

  @override
  bool canActivate() => stateService.store.state.system.isAuthorized;
}
