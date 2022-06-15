import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';

class Tester extends TeamMember {
  Tester({required String name}) : super(name);

  @override
  String toString() {
    return '$name (QA)';
  }
}
