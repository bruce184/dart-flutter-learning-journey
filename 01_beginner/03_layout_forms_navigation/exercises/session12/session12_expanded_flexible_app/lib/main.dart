import 'package:flutter/material.dart';
import 'package:session12_expanded_flexible_app/screens/session12_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Session 12 Expanded Flexible',
      home: Session12HomePage(),
    );
  }
}
