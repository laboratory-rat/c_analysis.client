import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_router/src/router/router.dart';
import 'package:c_analysis/src/module/screen/basic/basic.screen.component.dart';
import 'package:c_analysis/src/service/api/coin.history.service.dart';
import 'package:c_analysis/src/service/api/coin.service.dart';
import 'package:c_analysis/src/service/local/state.service.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';
import 'package:chartjs/chartjs.dart';

@Component(
    selector: 'chart-agent-component',
    templateUrl: './chart.agent.component.html',
    styleUrls: [
      './chart.agent.component.css'
    ],
    directives: [
      materialInputDirectives,
      MaterialButtonComponent,
      MaterialIconComponent,
      MaterialDropdownSelectComponent
    ])
class ChartAgentComponent extends BasicScreenComponent with AfterViewInit {
  final CoinService _coinService;
  final CoinHistoryService _coinHistoryService;
  ChartAgentComponent(StateService stateService, SnackService snackService,
      Router router, this._coinService, this._coinHistoryService)
      : super(stateService, snackService, router);

  @ViewChild('chart')
  CanvasElement chartElemenet;
  Chart chart;

  Random _rnd = Random();
  List<String> months = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June"
  ];

  @override
  void ngOnInit() {}

  @override
  void ngAfterViewInit() {
    window.console.dir(chartElemenet);
    var data = LinearChartData(labels: months, datasets: _buildDatasets());

    var config = ChartConfiguration(
        type: 'line', data: data, options: ChartOptions(responsive: false));

    chart = Chart(chartElemenet, config);
  }

  List<ChartDataSets> _buildDatasets() => <ChartDataSets>[
        ChartDataSets(
            label: 'test 1',
            backgroundColor: 'red',
            data: months.map((m) => _rnd.nextInt(255)).toList()),
        ChartDataSets(
            label: 'test 2',
            backgroundColor: 'blue',
            data: months.map((m) => _rnd.nextInt(255)).toList())
      ];
}
