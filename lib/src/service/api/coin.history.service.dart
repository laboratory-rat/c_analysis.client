import 'package:c_analysis/src/config/config.dart';
import 'package:c_analysis/src/infrastructure/coin_history/coin.history.search.model.dart';
import 'package:c_analysis/src/service/api/api.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';

class CoinHistoryService extends Api {
  CoinHistoryService(Config config, UserLocalService userService)
      : super(config, userService);

  Future<Map<String, dynamic>> search({CoinHistorySearchModel search}) =>
      putRequest('/history/search', data: search.toJson());
}
