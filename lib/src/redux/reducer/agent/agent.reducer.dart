import 'package:c_analysis/src/redux/state/agent/agent.create.state.dart';
import 'package:c_analysis/src/redux/state/system/system.state.dart';
import 'package:c_analysis/src/redux/actions/agent/create/agent.create.actions.dart';

AgentCreateState agentReducer(AgentCreateState state, action) {
  if(action is AgentCreateUploadCoinsSuccessAction){
    return AgentCreateState(
      avaliableAccents: state.avaliableAccents,
      avaliableCoins: action.list,
      selectedAccent: state.selectedAccent,
      selectedPrimary: state.selectedPrimary,
    )
  }

  return state;
}
