import 'package:flutter/material.dart';

class SessionTitle extends StatelessWidget {
  final String text;

  // Constructor
  const SessionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
