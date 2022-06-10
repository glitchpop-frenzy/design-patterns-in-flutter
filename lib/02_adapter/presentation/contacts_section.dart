import 'dart:developer';

import 'package:design_patterns_in_flutter/02_adapter/domain/i_contacts_adapter.dart';
import 'package:design_patterns_in_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;
  const ContactSection({
    Key? key,
    required this.adapter,
    required this.headerText,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  List<Contact> contactList = [];

  void _getContacts() {
    log('Get Contacts has been called for ${widget.headerText}');
    setState(() {
      contactList.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.headerText),
        Stack(
          children: [
            AnimatedOpacity(
              opacity: contactList.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var contact in contactList)
                    Card(
                      child: Text(
                        contact.fullName,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: contactList.isEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: pillButton(
                context: context,
                child: const Text(
                  'Get Contacts',
                  style: TextStyle(color: Colors.white),
                ),
                onButtonPress: _getContacts,
              ),
            )
          ],
        )
      ],
    );
  }
}
