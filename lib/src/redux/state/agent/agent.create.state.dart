import 'package:c_analysis/src/infrastructure/coin/coin.display.short.model.dart';
import 'package:chartjs/chartjs.dart';

final agentCreateStateInit = AgentCreateState(
    name: '',
    avaliableCoins: [],
    avaliableAccents: ['USD', 'BTC'],
    selectedPrimary: '',
    selectedAccent: 'USD',
    from: DateTime.now().subtract(Duration(days: 30)),
    until: DateTime.now(),
    isChartUpdating: false,
    isRedrawRequested: false,
    chartType: 'Linear',
    chartDataSets: ChartDataSets());

class AgentCreateState {
  String name;
  List<CoinDisplayShortModel> avaliableCoins;
  List<String> avaliableAccents;

  String selectedPrimary;
  String selectedAccent;

  DateTime from;
  DateTime until;

  bool isChartUpdating;
  bool isRedrawRequested;
  String chartType;
  ChartDataSets chartDataSets;

  AgentCreateState(
      {this.name,
      this.avaliableCoins,
      this.avaliableAccents,
      this.from,
      this.until,
      this.selectedPrimary,
      this.selectedAccent,
      this.isChartUpdating,
      this.isRedrawRequested,
      this.chartType,
      this.chartDataSets});
}
