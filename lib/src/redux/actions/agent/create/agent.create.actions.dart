import 'package:c_analysis/src/infrastructure/coin/coin.display.short.model.dart';
import 'package:c_analysis/src/infrastructure/coin_history/coin.history.display.model.dart';
import 'package:c_analysis/src/infrastructure/coin_history/coin.history.search.model.dart';
import 'package:c_analysis/src/redux/actions/basic/loading.actions.dart';
import 'package:c_analysis/src/service/api/coin.history.service.dart';
import 'package:c_analysis/src/service/api/coin.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

class AgentCreateUploadCoinsAction extends LoadingStartAction {
  final CoinService service;
  final CoinHistoryService coinHistoryService;
  final SnackService snackService;

  AgentCreateUploadCoinsAction(
      {this.service, this.coinHistoryService, this.snackService});
}

class AgentCreateUploadCoinsSuccessAction extends LoadingStopAction {
  List<CoinDisplayShortModel> list;

  AgentCreateUploadCoinsSuccessAction({this.list});
}

class AgentCreateUploadCoinsFailAction extends LoadingStopAction {}

class AgentCreateSelectCoinsAction {
  final String primary;
  final String accent;
  final CoinHistoryService coinHistoryService;

  AgentCreateSelectCoinsAction(
      {this.primary, this.accent, this.coinHistoryService});
}

class AgentCreateSelectDateRangeAction {
  final DateTime from;
  final DateTime until;
  final CoinHistoryService coinHistoryService;

  AgentCreateSelectDateRangeAction(
      {this.from, this.until, this.coinHistoryService});
}

class AgentCreateUploadHistoryAction extends LoadingStartAction {
  final CoinHistoryService coinHistoryService;
  final CoinHistorySearchModel model;

  AgentCreateUploadHistoryAction({this.coinHistoryService, this.model});
}

class AgentCreateUploadHistorySuccessAction extends LoadingStopAction {
  final CoinHistoryDisplayModel history;

  AgentCreateUploadHistorySuccessAction({this.history});
}

class AgentCreateUploadHistoryFailAction extends LoadingStopAction {}

class AgentCreateRequestRedrawAction {}

class AgentCreateRequestRedrawCloseAction {}
