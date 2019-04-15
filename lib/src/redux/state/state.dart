import 'package:c_analysis/src/redux/state/agent/agent.state.dart';

import 'all.dart';

final State stateInit = State(
    system: systemStateInit, layout: layoutStateInit, agent: agentStateInit);

class State {
  final SystemState system;
  final LayoutState layout;
  final AgentState agent;

  State({this.system, this.layout, this.agent});
}
