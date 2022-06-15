import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';

class Admin extends TeamMember {
  Admin({required String name}) : super(name);

  @override
  String toString() {
    return '$name (Admin)';
  }
}
