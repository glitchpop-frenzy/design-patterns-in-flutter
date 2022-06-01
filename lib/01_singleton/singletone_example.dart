import 'package:design_patterns_in_flutter/01_singleton/core/singleton_state_base.dart';
import 'package:design_patterns_in_flutter/01_singleton/singleton_calls/call_by_definition.dart';
import 'package:design_patterns_in_flutter/01_singleton/singleton_calls/call_by_magic.dart';
import 'package:design_patterns_in_flutter/01_singleton/singleton_calls/call_without_singleton.dart';
import 'package:design_patterns_in_flutter/01_singleton/widgets/singleton_card.dart';
import 'package:design_patterns_in_flutter/platform_specific/platform_buttons.dart';
import 'package:design_patterns_in_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class SingletonExample extends StatefulWidget {
  const SingletonExample({Key? key}) : super(key: key);

  @override
  State<SingletonExample> createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  List<SingletonStateBase> singletonStateList = [
    CallWithoutSingleton(),
    SingletonCallByDefinition.getState(),
    SingletonByDartMagic(),
  ];

  _resetText() {
    for (var state in singletonStateList) {
      state.reset();
    }
    setState(() {});
  }

  _setStateText([String text = 'Singleton']) {
    for (var state in singletonStateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            for (SingletonStateBase state in singletonStateList)
              Padding(
                padding: const EdgeInsets.only(bottom: paddingL),
                child: SingletonCard(
                  text: state.currentText,
                ),
              ),
            const SizedBox(
              height: spaceB,
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _setStateText,
              text: "Change states' text to 'Singleton'",
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _resetText,
              text: "Reset the code",
            ),
            const SizedBox(
              height: spaceB,
            ),

            // TODO to implement menu option to see how singleton behaves
            // const Text(
            //   'Note: change states\' and navigate to see how Singleton behaves.',
            //   textAlign: TextAlign.justify,
            // ),
          ],
        ),
      ),
    );
  }
}
