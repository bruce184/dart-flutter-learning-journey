/*
MaterialApp
- Scaffold
  - AppBar
  - body
    - Center
      - Column
        - SessionTitle
        - LearningText
        - LearningText
        - LearningText
*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "First App",
      home: const HomePage(),
    );
  }
}

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session 7"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SessionTitle(text: "StatelessWidget"),
            SizedBox(height: 12),
            LearningText(text: "StatelessWidget has no mutable state"),
            SizedBox(height: 5),
            LearningText(text: "build() describes the UI"),
            SizedBox(height: 5),
            LearningText(text: "final fields store widget configuration"),
          ],
        ),
      ),
    );
  }
}
