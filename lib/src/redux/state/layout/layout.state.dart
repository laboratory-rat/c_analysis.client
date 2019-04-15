final LayoutState layoutStateInit =
    LayoutState(loadingCounter: 0, isWide: false);

class LayoutState {
  final int loadingCounter;
  bool isLoading;
  final bool isWide;

  LayoutState({this.loadingCounter, this.isWide}) {
    isLoading = loadingCounter != 0;
  }
}
