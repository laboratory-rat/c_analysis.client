import 'package:c_analysis/src/redux/state/agent/agent.create.state.dart';

final agentStateInit = AgentState(create: agentCreateStateInit);

class AgentState {
  AgentCreateState create;

  AgentState({this.create});
}
