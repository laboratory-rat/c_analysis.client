import 'package:angular_router/angular_router.dart';

import '../module/screen/common/about/about.screen.component.template.dart'
    as about_template;
import '../module/screen/common/login/login.screen.component.template.dart'
    as login_template;

// user
import '../module/screen/user/dashboard/dashboard.screen.component.template.dart'
    as dashboard_template;
import '../module/screen/user/agent/list/agent.list.screen.component.template.dart'
    as agent_list_template;
import '../module/screen/user/agent/create/agent.create.screen.component.template.dart'
    as agent_create_template;

import './route.path.dart';
export './route.path.dart';

class AppRoute {
  static final about = RouteDefinition(
      routePath: AppRoutePath.about,
      component: about_template.AboutScreenComponentNgFactory);
  static final login = RouteDefinition(
      routePath: AppRoutePath.login,
      component: login_template.LoginScreenComponentNgFactory);

  // user
  static final dashboard = RouteDefinition(
      routePath: AppRoutePath.dashboard,
      component: dashboard_template.DashboardScreenComponentNgFactory);
  static final agentList = RouteDefinition(
      routePath: AppRoutePath.agentList,
      component: agent_list_template.AgentListScreenComponentNgFactory);
  static final agentCreate = RouteDefinition(
      routePath: AppRoutePath.agentCreate,
      component: agent_create_template.AgentCreateScreenComponentNgFactory);

  static final all = <RouteDefinition>[
    about,
    login,
    dashboard,
    agentList,
    agentCreate
  ];
}
