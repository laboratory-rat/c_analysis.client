import 'package:angular_router/angular_router.dart';

class AppRoutePath {
  static final RoutePath about = RoutePath(path: 'about', useAsDefault: true);
  static final RoutePath login = RoutePath(path: 'login');

  //user
  static final RoutePath dashboard = RoutePath(path: 'dashboard');
  static final RoutePath agentList = RoutePath(path: 'agent/list');
  static final RoutePath agentCreate = RoutePath(path: 'agent/create');
}
