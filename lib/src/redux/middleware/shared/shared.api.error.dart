import 'dart:html';

import 'package:c_analysis/src/infrastructure/response/response.error.dart';
import 'package:c_analysis/src/redux/actions/common/snack.actions.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:c_analysis/src/service/window/snack.service.dart';
import 'package:redux/redux.dart';

Function hadleApiError(
    Store<State> store, SnackService snackService, Function subcall) {
  return (dynamic error) {
    if (error is ResponseError) {
      store.dispatch(SnackApiErrorAction(error: error, service: snackService));
    } else {
      window.console.error(error);
    }

    subcall(error);
  };
}
