import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:c_analysis/src/infrastructure/user/user.model.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

abstract class BasicScreenComponent implements OnInit, OnActivate {
  final StateService stateService;
  final SnackService snackService;
  final Router router;

  BasicScreenComponent(this.stateService, this.snackService, this.router);

  // props
  UserModel user;
  String locale;
  bool isLoading = false;
  bool isAuthorized = false;

  @override
  void ngOnInit() {
    stateService.store.onChange.listen((state) => syncState(state));
  }

  void syncState(State state) {
    user = state.system.user;
    locale = state.system.locale;
    isAuthorized = state.system.isAuthorized;
    isLoading = state.layout.isLoading;
  }

  @override
  void onActivate(RouterState previous, RouterState current) {}

  bool canActivate() {
    return true;
  }

  void dispatch(action) => stateService.store.dispatch(action);
}
