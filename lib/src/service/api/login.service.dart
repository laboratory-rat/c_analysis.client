import 'package:angular/angular.dart';
import 'package:c_analysis/src/config/config.dart';
import 'package:c_analysis/src/service/api/api.dart';
import 'package:c_analysis/src/service/local/user.local.service.dart';

@Injectable()
class LoginService extends Api {
  LoginService(Config config, UserLocalService userService)
      : super(config, userService);

  Future<Map<String, dynamic>> approveLogin(String token) =>
      putRequest('login/approve', query: {'token': token});

  Future<Map<String, dynamic>> ping() => getRequest('login/ping');
}
