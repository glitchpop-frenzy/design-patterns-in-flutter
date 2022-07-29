import 'dart:math';

import 'package:design_patterns_in_flutter/22-mediator/application/developer_model.dart';
import 'package:design_patterns_in_flutter/22-mediator/application/team_notification_hub_model.dart';
import 'package:design_patterns_in_flutter/22-mediator/application/tester_model.dart';
import 'package:design_patterns_in_flutter/22-mediator/domain/i_notification_hub.dart';
import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';
import 'package:design_patterns_in_flutter/22-mediator/presentation/widgets/notification_list.dart';
import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

import '../application/admin_model.dart';

class MendingMediator extends StatefulWidget {
  const MendingMediator({Key? key}) : super(key: key);

  @override
  State<MendingMediator> createState() => _MendingMediatorState();
}

class _MendingMediatorState extends State<MendingMediator> {
  late final NotificationHub _notificationHub;
  final _admin = Admin(name: 'Shiva');

  @override
  void initState() {
    super.initState();
    final _members = [
      _admin,
      Developer(name: 'Vishnu'),
      Developer(name: 'Brahma'),
      Developer(name: 'Krishna'),
      Developer(name: 'Rama'),
      Tester(name: 'Bhadrakali'),
      Tester(name: 'Rudra'),
    ];
    _notificationHub = TeamNotificationHub(members: _members);
  }

  void _sendToAll() {
    setState(() {
      _admin.send('Sending to all');
    });
  }

  void _sendToQa() {
    setState(() {
      _admin.sendTo<Tester>('Sending to QA');
    });
  }

  void _sendToDevs() {
    setState(() {
      _admin.sendTo<Developer>('Sending to Devs');
    });
  }

  void _addTeamMember() {
    const name = 'Fake Name';
    final teamMember = Random().nextBool()
        ? Tester(name: '$name (Tester)')
        : Developer(name: '$name (Developer)');
    setState(() {
      _notificationHub.register(teamMember);
    });
  }

  void _sendFromMember(TeamMember member) {
    setState(() {
      member.send('Hello from ${member.name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor2,
      appBar: AppBar(
        backgroundColor: accentColor2,
        title: const Text(
          'Mending MEDIATOR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buttonSep,
              PillButton(
                child: const Text('Admin: Send "Hello" to all!'),
                onButtonPress: _sendToAll,
              ),
              buttonSep,
              PillButton(
                child: const Text('Admin: Send "BUG!" to QA!'),
                onButtonPress: _sendToQa,
              ),
              buttonSep,
              PillButton(
                child: const Text('Admin: Send "Hello, World!!" to the devs!'),
                onButtonPress: _sendToDevs,
              ),
              buttonSep,
              const Divider(),
              buttonSep,
              PillButton(
                child: const Text('Add team member'),
                onButtonPress: _addTeamMember,
              ),
              buttonSep,
              NotificationList(
                members: _notificationHub.getTeamMembers(),
                onTap: _sendFromMember,
              )
            ],
          )),
        ),
      ),
    );
  }
}
