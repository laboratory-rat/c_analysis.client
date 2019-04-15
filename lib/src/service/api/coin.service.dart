import 'package:c_analysis/src/config/config.dart';
import 'package:c_analysis/src/service/api/api.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';

class CoinService extends Api{
  CoinService(Config config, UserLocalService userService) : super(config, userService);

  Future<List<Map<String, dynamic>>> allCoins() 
    => getListRequest('/coin/all');

}