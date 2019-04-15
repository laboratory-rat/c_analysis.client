import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/config/config.dart';
import 'package:c_analysis/src/module/screen/layout/app.layout.component.template.dart'
    as ng;
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

import 'main.template.dart' as self;

const config = Config.debug();

@GenerateInjector([
  routerProvidersHash,
  ValueProvider(Config, config),
  ClassProvider(SnackService),
  ClassProvider(StateService)
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppLayoutComponentNgFactory, createInjector: injector);
}
