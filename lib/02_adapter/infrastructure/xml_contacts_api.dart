class XmlContactsApi {
  final String _contactsXml = '''
    <?xml version="1.0"?>
    <contacts>
      <contact>
        <fullname>marshal</fullname>
        <email>marshal@beercules.com</email>
        <favourite>true</favourite>
      </contact>
      <contact>
        <fullname>lily</fullname>
        <email>lilypad@thelook.com</email>
        <favourite>false</favourite>
      </contact>
    </contacts>
  ''';

  String getContactsXml() {
    return _contactsXml;
  }
}
