import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';

abstract class NotificationHub {
  List<TeamMember> getTeamMembers();
  void register(TeamMember member);
  void send(TeamMember sender, String message);
  void sendTo<T extends TeamMember>(TeamMember sender, String message);
}
