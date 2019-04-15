import 'package:c_analysis/src/redux/state/state.dart';
import './all.dart';

State reducer(State state, action) {
  return State(
      layout: layoutReducer(state.layout, action),
      system: systemReducer(state.system, action));
}
