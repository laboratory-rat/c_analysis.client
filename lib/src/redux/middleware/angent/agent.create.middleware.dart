import 'package:c_analysis/src/infrastructure/coin/coin.display.short.model.dart';
import 'package:c_analysis/src/infrastructure/coin_history/coin.history.display.model.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';
import 'package:c_analysis/src/redux/actions/agent/create/agent.create.actions.dart';

void commonMiddleware(Store<State> store, action) {
  if (action is AgentCreateUploadCoinsAction) {
    action.service.allCoins().then((maps) {
      var list = maps.map((x) => CoinDisplayShortModel.fromJson(x)).toList();
      store.dispatch(AgentCreateUploadCoinsSuccessAction(list: list));
    }).catchError((error) {
      store.dispatch(AgentCreateUploadCoinsFailAction());
    });
  } else if (action is AgentCreateUploadHistoryAction) {
    action.coinHistoryService.search(search: action.model).then((json) {
      var result = CoinHistoryDisplayModel.fromJson(json);
      store.dispatch(AgentCreateUploadHistorySuccessAction(history: result));
    }).catchError((error) {
      store.dispatch(AgentCreateUploadHistoryFailAction());
    });
  }
}
