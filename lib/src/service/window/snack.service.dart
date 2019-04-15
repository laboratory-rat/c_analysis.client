import 'dart:async';

import 'package:angular/angular.dart';
import 'dart:html';

const int DEFAULT_TIMEOUT = 10000;

@Injectable()
class SnackService {
  static List<SnackMetadata> _pull = List<SnackMetadata>();
  static Timer _timer = Timer(Duration(milliseconds: DEFAULT_TIMEOUT), () {})..cancel();

  DivElement _holder;

  void emitSimple({String text}) => emit(SnackMetadata(bodyText: text));

  void emitWithAction({String text, String actionText, Function action}) =>
      emit(SnackMetadata(
          bodyText: text,
          primaryActionText: actionText,
          primaryAction: action));

  void emit(SnackMetadata metadata) {
    _init();
    var element = _build(metadata);

    _pull.add(metadata);
    if (!_timer.isActive) {
      _snackDisplay(element);
      _timer = Timer(Duration(milliseconds: DEFAULT_TIMEOUT), () {
        _destroyLast();
      });
    }
  }

  _init() {
    _holder = querySelector('body .snack-holder');
    if (_holder == null) {
      _holder = DivElement()..className = 'snack-holder';
      querySelector('body').children.add(_holder);
    }
  }

  Element _build(SnackMetadata metadata) {
    var snack = DivElement()
      ..className = 'snack'
      ..onClick.listen(($event) {
        metadata.dissmissAction = metadata.dissmissAction ?? (Event event) {};
        metadata.dissmissAction($event);
        _destroyLast();
      });

    if (metadata.customClass != null) {
      snack.className += ' ${metadata.customClass}';
    }

    var snackInner = DivElement()..className = 'snack__inner';
    snack.children.add(snackInner);

    var infoBar = DivElement()..className = 'snack--info';
    var actionsBar = DivElement()..className = 'snack--actions';

    snackInner.children.add(infoBar);
    snackInner.children.add(actionsBar);

    if (metadata.openingIcon != null) {
      var icon = Element.tag('i')
        ..className = 'material-icons'
        ..text = metadata.openingIcon;

      infoBar.children.add(icon);
      infoBar.className = infoBar.className + ' snack--info-icon';
    }

    var body = DivElement()
      ..className = 'text'
      ..text = metadata.bodyText;

    infoBar.children.add(body);

    if (metadata.primaryAction != null) {
      var primaryAction = ButtonElement()
        ..className = 'action-primary'
        ..text = metadata.primaryActionText
        ..onClick.listen(($event) {
          metadata.primaryAction($event);
          _destroyLast();
        });

      actionsBar.children.add(primaryAction);
    }

    var dissmissAction = Element.tag('i')
      ..className = 'material-icons action-dismiss'
      ..text = 'clear'
      ..onClick.listen(($event) {
        metadata.dissmissAction = metadata.dissmissAction ?? (Event event) {};
        metadata.dissmissAction($event);
        _destroyLast();
      });

    actionsBar.children.add(dissmissAction);

    metadata.self = snack;
    return snack;
  }

  Future _destroyLast() async {
    if (_timer.isActive) {
      _timer.cancel();
    }

    if (_pull.length == 0) {
      return;
    }

    var last = _pull[0];
    _pull.removeAt(0);

    await _snackHide(last.self);

    if (_pull.length != 0) {
      last = _pull[0];
      _snackDisplay(last.self);
      _timer = Timer(Duration(milliseconds: DEFAULT_TIMEOUT), () {
        _destroyLast();
      });
    }
  }

  Future _snackDisplay(DivElement element) async {
    _holder.children.add(element);
    element.classes.add('snack--appear');
    await Future.delayed(Duration(milliseconds: 175));
    element.classes.remove('snack--appear');
  }

  Future _snackHide(DivElement element) async {
    element.className += ' snack--hide';
    await Future.delayed(Duration(milliseconds: 175));
    element.remove();
  }
}

class SnackMetadata {
  String customClass;

  String openingIcon;
  String bodyText;

  Function primaryAction;
  String primaryActionText;

  Function dissmissAction;

  DivElement self;

  SnackMetadata({
    this.customClass,
    this.openingIcon,
    this.bodyText,
    this.primaryAction,
    this.primaryActionText,
    this.dissmissAction,
  });
}
