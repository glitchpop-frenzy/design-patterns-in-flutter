import 'package:design_patterns_in_flutter/02_adapter/application/json_contacts_adapter.dart';
import 'package:design_patterns_in_flutter/02_adapter/application/xml_contacts_adapter.dart';
import 'package:design_patterns_in_flutter/02_adapter/presentation/contacts_section.dart';
import 'package:design_patterns_in_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AwesomeAdapter extends StatelessWidget {
  const AwesomeAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor2,
      appBar: AppBar(
        backgroundColor: accentButtonBgColor,
        title: const Text(
          'Awesome Adapter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: paddingL),
          child: Column(
            children: [
              ContactSection(
                adapter: JsonContactsAdapter(),
                headerText: 'JSON Contacts',
              ),
              ContactSection(
                adapter: XmlContactsAdapter(),
                headerText: 'XML Contacts',
              )
            ],
          ),
        ),
      ),
    );
  }
}
