import 'package:c_analysis/src/infrastructure/response/response.error.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';

class SnackAction {
  final SnackService service;
  final String message;

  SnackAction({this.service, this.message});
}

class SnackApiErrorAction {
  final SnackService service;
  final ResponseError error;
  String message;

  SnackApiErrorAction({this.error, this.service}) {
    if (error != null) {
      message = error.user_message ?? error.message;
    } else {
      message = 'Undefined error';
    }
  }
}
