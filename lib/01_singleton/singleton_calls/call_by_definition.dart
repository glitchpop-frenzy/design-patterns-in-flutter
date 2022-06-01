import 'package:design_patterns_in_flutter/01_singleton/core/singleton_state_base.dart';

class SingletonCallByDefinition extends SingletonStateBase {
  static SingletonCallByDefinition? _instance;

  SingletonCallByDefinition._internal() {
    initialText =
        "A new 'SingletonCallByDefinition ' instance has been created.";
    stateText = initialText;
    // ignore: avoid_print
    print(stateText);
  }

  static SingletonCallByDefinition getState() {
    _instance ??= SingletonCallByDefinition._internal();
    return _instance!;
  }
}
