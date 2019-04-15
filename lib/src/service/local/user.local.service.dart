import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:c_analysis/src/infrastructure/user/user.model.dart';

const String USER_KEY = "mr_user";

@Injectable()
class UserLocalService {
  static UserModel _user;

  bool get isAuthed => _user != null;

  UserModel get user {
    if (_user == null && window.localStorage.containsKey(USER_KEY)) {
      _user = UserModel.fromJson(json.decode(window.localStorage[USER_KEY]));
    }

    return _user;
  }

  set user(UserModel user) {
    _user = user;

    if (window.localStorage.containsKey(USER_KEY)) {
      window.localStorage.remove(USER_KEY);
    }

    if (user != null) {
      window.localStorage[USER_KEY] = json.encode(user.toJson());
    }
  }
}
