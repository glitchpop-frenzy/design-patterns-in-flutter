import 'package:design_patterns_in_flutter/22-mediator/domain/i_notification_hub.dart';
import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';

class TeamNotificationHub extends NotificationHub {
  final _teamMembers = <TeamMember>[];

  TeamNotificationHub({List<TeamMember>? members}) {
    members?.forEach(register);
  }
  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  @override
  void register(TeamMember member) {
    member.notificationHub = this;
    _teamMembers.add(member);
  }

  @override
  void send(TeamMember sender, String message) {
    final filteredMembers = _teamMembers.where((m) => m != sender);
    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }

  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filteredMembers =
        _teamMembers.where((m) => m != sender).whereType<T>();
    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }
}
