class JsonContactsApi {
  final String _contactJson = '''
  {
    "contacts": [
      {
        "fullName": "barney (json)",
        "email": "barnicle@awesome.com",
        "favourite": true,
      },
      {
        "fullName": "ted (json)",
        "email": "schmosby@theone.com",
        "favourite": false,
      },
      {
        "fullName": "robin (json)",
        "email": "robin@oat.com",
        "favourite": false,
      },
    ]
  }
  ''';
  String getContactsJson() {
    return _contactJson;
  }
}
