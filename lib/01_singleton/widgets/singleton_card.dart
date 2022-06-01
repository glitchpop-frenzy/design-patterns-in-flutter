import 'package:flutter/material.dart';

class SingletonCard extends StatelessWidget {
  final String? text;

  const SingletonCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(text!),
    );
  }
}
