import 'package:design_patterns_in_flutter/01_singleton/core/singleton_state_base.dart';

class CallWithoutSingleton extends SingletonStateBase {
  CallWithoutSingleton() {
    initialText =
        "A new way in which 'CallWithoutSingleton' instanc ehas been created.";
    stateText = initialText;
    // ignore: avoid_print
    print(stateText);
  }
}
