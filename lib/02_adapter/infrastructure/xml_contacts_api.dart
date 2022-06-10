class XmlContactsApi {
  final String _contactsXml = '''
    <?xml version="1.0"?>
    <contacts>
      <contact>
        <fullName>marshal</fullName>
        <email>marshal@beercules.com</email>
        <favourite>true</favourite>
      </contact>
      <contact>
        <fullName>lily</fullName>
        <email>lilypad@thelook.com</email>
        <favourite>false</favourite>
      </contact>
    </contacts>
  ''';

  String getContactsXml() {
    return _contactsXml;
  }
}
