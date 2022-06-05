import '../models/contact_model.dart';

abstract class IContactsAdapter {
  List<Contact> getContacts();
}
