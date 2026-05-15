import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Session 13 ListView")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Beginner Sessions",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Review your completed Flutter learning path"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        debugPrint('Selected ${lesson.title}');
                      },
                      leading: Icon(lesson.icon),
                      title: Text(lesson.title),
                      subtitle: Text(lesson.subtitle),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Divider(height: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Lesson {
  const Lesson({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

const lessons = [
  Lesson(
    title: "Session 1",
    subtitle: "Environment setup",
    icon: Icons.settings,
  ),
  Lesson(
    title: "Session 2",
    subtitle: "First Flutter app",
    icon: Icons.phone_android,
  ),
  Lesson(title: "Session 3", subtitle: "Dart basics 1", icon: Icons.code),
  Lesson(title: "Session 4", subtitle: "Dart basics 2", icon: Icons.data_array),
  Lesson(
    title: "Session 5",
    subtitle: "OOP, async, and mini CLI",
    icon: Icons.school,
  ),
  Lesson(
    title: "Session 6",
    subtitle: "Flutter mindset",
    icon: Icons.account_tree,
  ),
  Lesson(title: "Session 7", subtitle: "StatelessWidget", icon: Icons.widgets),
  Lesson(
    title: "Session 8",
    subtitle: "StatefulWidget and setState",
    icon: Icons.touch_app,
  ),
  Lesson(title: "Session 9", subtitle: "Split widgets", icon: Icons.folder),
  Lesson(
    title: "Session 10",
    subtitle: "Basic debugging",
    icon: Icons.bug_report,
  ),
  Lesson(
    title: "Session 11",
    subtitle: "Row, Column, Padding, SizedBox",
    icon: Icons.view_column,
  ),
  Lesson(
    title: "Session 12",
    subtitle: "Expanded, Flexible, Constraints",
    icon: Icons.open_in_full,
  ),
  Lesson(title: "Session 13", subtitle: "ListView", icon: Icons.list),
];
