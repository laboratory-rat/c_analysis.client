import 'package:c_analysis/src/infrastructure/user/user.model.dart';

final SystemState systemStateInit = SystemState(user: null, locale: '');

class SystemState {
  final UserModel user;
  final String locale;

  bool get isAuthorized => user != null;
  bool get isUser => user?.roles?.contains('USER') ?? false;
  bool get isAdmin => user?.roles?.contains('ADMIN') ?? false;

  SystemState({this.user, this.locale});
}
