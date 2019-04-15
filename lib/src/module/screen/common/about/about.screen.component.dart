import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/redux/actions/common/snack.actions.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

@Component(
    selector: 'about-screen-component',
    templateUrl: './about.screen.component.html',
    styleUrls: ['./about.screen.component.css'],
    directives: [
      MaterialButtonComponent,
      MaterialIconComponent
    ],
    providers: [ClassProvider(StateService), ClassProvider(SnackService)])
class AboutScreenComponent extends BasicScreenComponent {
  AboutScreenComponent(
      StateService stateService, SnackService snackService, Router router)
      : super(stateService, snackService, router);

  void emitSnack() {
    dispatch(SnackAction(service: snackService, message: 'SOME TEST MESSAGE'));
  }
}
