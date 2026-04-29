/*
MaterialApp
- Scaffold
  - AppBar
  - body
    - Center
      - Column
        - SessionTitle
        - Counter Text
        - ElevatedButton
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session 8"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SessionTitle(text: "StatefulWidget + setState"),
            const SizedBox(height: 12),
            Text("Counter: $_counter", style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("Increase Counter"),
            ),
          ],
        ),
      ),
    );
  }
}
