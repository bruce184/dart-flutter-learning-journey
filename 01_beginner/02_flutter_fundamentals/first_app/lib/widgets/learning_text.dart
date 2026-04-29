import 'package:flutter/material.dart';

// Widget for the text display in HomePage, instead of repeating Text widget
class LearningText extends StatelessWidget {
  final String text;

  // Constructor
  const LearningText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 18));
  }
}
