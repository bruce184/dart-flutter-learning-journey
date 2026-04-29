/*
MaterialApp
- Scaffold
  - AppBar
  - body
    - Center
      - Column
        - Text
        - Text
        - Text
        - Text
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session 6"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Flutter Mindset",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "Everything is a Widget",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "UI is built as a Widget Tree",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              "I can read a Widget Tree",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
