import 'dart:convert';

import 'package:design_patterns_in_flutter/02_adapter/domain/i_contacts_adapter.dart';
import 'package:design_patterns_in_flutter/02_adapter/infrastructure/json_contacts_api.dart';
import 'package:design_patterns_in_flutter/02_adapter/models/contact_model.dart';

class JsonContactsAdaper implements IContactsAdapter {
  final JsonContactsApi _api = JsonContactsApi();
  @override
  List<Contact> getContacts() {
    final contactsJson = _api.getContactsJson();
    final List<Contact> contactList = _parseContactsJson(contactsJson);
    return contactList;
  }

  List<Contact> _parseContactsJson(String contactJson) {
    final contactsMap = json.decode(contactJson) as Map<String, dynamic>;
    final contactJsonList = contactsMap["contacts"] as List;
    List<Contact> contactList = contactJsonList
        .map((jsonContact) => Contact(
              email: jsonContact['email'],
              favourite: jsonContact['favourite'],
              fullName: jsonContact['fullName'],
            ))
        .toList();
    return contactList;
  }
}
