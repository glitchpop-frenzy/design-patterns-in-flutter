import 'package:design_patterns_in_flutter/22-mediator/domain/i_team_member.dart';
import 'package:design_patterns_in_flutter/utils/constants.dart';
import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List<TeamMember> members;
  final ValueSetter<TeamMember> onTap;
  const NotificationList({
    Key? key,
    required this.members,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Last Notification',
          style: TextStyle(color: Colors.white),
        ),
        const Text(
          'Click on card to send notification from the team member',
          style: TextStyle(color: Colors.white),
        ),
        buttonSep,
        for (TeamMember member in members)
          Card(
            child: InkWell(
              onTap: () => onTap(member),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: paddingL, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.toString(),
                          ),
                          Text(
                            member.lastNotification ?? '-',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: paddingL),
                    child: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
