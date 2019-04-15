import 'package:angular/angular.dart';
import 'package:c_analysis/src/redux/state/state.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:c_analysis/src/redux/middleware/middleware.dart';
import 'package:c_analysis/src/redux/reducer/reducer.dart';

@Injectable()
class StateService {
  static Store<State> _store;

  Store<State> get store {
    if (_store == null) {
      _store = _newStore;
    }
    return _store;
  }

  static Store<State> get _newStore =>
      Store<State>(reducer, initialState: stateInit, middleware: [middleware]);
}
