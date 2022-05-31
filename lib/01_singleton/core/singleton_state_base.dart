import 'package:meta/meta.dart';

abstract class SingletonStateBase {
  // protected methods and objects
  // accessible to only those who extends this class
  @protected
  String? initialText;
  @protected
  String? stateText;
  String? get currentTest => initialText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset() {
    stateText = initialText;
  }
}
