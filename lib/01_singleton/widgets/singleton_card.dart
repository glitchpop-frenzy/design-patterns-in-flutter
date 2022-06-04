import 'package:flutter/material.dart';

class SingletonCard extends StatelessWidget {
  final String? text;

  const SingletonCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          child: Text(
            text!,
            style: const TextStyle(fontSize: 16.5),
          ),
        ),
      ),
    );
  }
}
