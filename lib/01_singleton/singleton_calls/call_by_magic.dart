import 'package:design_patterns_in_flutter/01_singleton/core/singleton_state_base.dart';

class SingletonByDartMagic extends SingletonStateBase {
  static final SingletonByDartMagic _instance =
      SingletonByDartMagic._internal();

  // factory method will return an existing instance or create a new instance
  factory SingletonByDartMagic() {
    return _instance;
  }

  SingletonByDartMagic._internal() {
    initialText = "A new way 'SingletonByDartMagic' has been created";
    stateText = initialText;
    // ignore: avoid_print
    print(stateText);
  }
}
