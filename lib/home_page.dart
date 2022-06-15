import 'package:auto_route/auto_route.dart';
import 'package:design_patterns_in_flutter/routes/router.dart';
import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal.shade900,
              title: const Text('Design Patterns in Flutter')),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            color: primaryBgColor,
            child: ListView(
              children: [
                buttonSep,
                PillButton(
                  child: const Text(
                    'Singleton magic',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onButtonPress: () async => await AutoRouter.of(context)
                      .push(const SingletonExampleRoute()),
                ),
                buttonSep,
                PillButton(
                  child: const Text(
                    'Awesome ADAPTER : Structural',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onButtonPress: () async => await AutoRouter.of(context)
                      .push(const AwesomeAdapterRoute()),
                ),
                buttonSep,
                PillButton(
                  child: const Text(
                    'Mending MEDIATOR : Structural',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onButtonPress: () async => await AutoRouter.of(context)
                      .push(const MendingMediatorRoute()),
                ),
              ],
            ),
          )),
    );
  }
}
