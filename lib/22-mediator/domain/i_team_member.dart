import 'package:design_patterns_in_flutter/22-mediator/domain/i_notification_hub.dart';

abstract class TeamMember {
  final String name;
  NotificationHub? notificationHub;
  String? lastNotification;
  TeamMember(this.name);

  void receive(String from, String message) {
    lastNotification = '$from: $message';
  }

  void send(String message) {
    notificationHub?.send(this, message);
  }

  void sendTo<T extends TeamMember>(String message) {
    notificationHub?.sendTo<T>(this, message);
  }
}
