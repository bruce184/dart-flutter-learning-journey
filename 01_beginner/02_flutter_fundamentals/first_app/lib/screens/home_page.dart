import 'package:flutter/material.dart';
import 'package:first_app/widgets/session_title.dart';
import 'package:first_app/widgets/counter_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/*
                      Center
                         |
                      Column
         /               |              \ 
    SessionTitle    CounterText   ElevatedButton
          |
"Split Widgets"
*/

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
        title: const Text("Session 9"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SessionTitle(text: "Split Widgets"),
            const SizedBox(height: 12),
            CounterText(counter: _counter),
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
