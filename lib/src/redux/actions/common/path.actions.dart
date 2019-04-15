import 'dart:html';

import 'package:angular_router/angular_router.dart';

class PathExternalRedirectAction {
  final Window window;
  final String url;

  PathExternalRedirectAction({this.window, this.url});
}

class PathNavigateAction{
  final Router router;
  final String path;

  PathNavigateAction({this.router, this.path});
}
