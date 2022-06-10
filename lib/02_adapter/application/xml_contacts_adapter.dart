import 'package:design_patterns_in_flutter/02_adapter/domain/i_contacts_adapter.dart';
import 'package:design_patterns_in_flutter/02_adapter/infrastructure/xml_contacts_api.dart';
import 'package:design_patterns_in_flutter/02_adapter/models/contact_model.dart';
import 'package:xml/xml.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final _api = XmlContactsApi();
  @override
  List<Contact> getContacts() {
    final contactXml = _api.getContactsXml();
    final contactList = _parseContactsXml(contactXml);
    return contactList;
  }

  List<Contact> _parseContactsXml(String contactXml) {
    final xmlDoc = XmlDocument.parse(contactXml);
    List<Contact> _xmlContactList = [];
    for (final xmlElement in xmlDoc.findElements('contact')) {
      final fullName = xmlElement.findElements('fullName').single.text;
      final email = xmlElement.findElements('email').single.text;
      final favourite = xmlElement.findElements('favourite').single.text;
      _xmlContactList.add(
        Contact(
            email: email,
            favourite: favourite.toLowerCase() == "true",
            fullName: fullName),
      );
    }
    return _xmlContactList;
  }
}
