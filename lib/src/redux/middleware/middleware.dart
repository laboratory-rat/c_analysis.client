import 'dart:html';

import 'package:c_analysis/src/redux/state/state.dart';
import 'package:redux/redux.dart';
import './all.dart';

void middleware(Store<State> store, action, NextDispatcher next) {
  print("[${action.runtimeType}]");
  window.console.dir(store);

  pathMiddleware(store, action);
  systemMiddleware(store, action);
  loginChallengeMiddleware(store, action);
  commonMiddleware(store, action);

  next(action);
}
