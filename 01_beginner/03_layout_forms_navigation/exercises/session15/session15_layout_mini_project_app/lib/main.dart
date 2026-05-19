import 'package:flutter/material.dart';

void main() {
  runApp(const Session15LayoutMiniProjectApp());
}

class Session15LayoutMiniProjectApp extends StatelessWidget {
  const Session15LayoutMiniProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Session 15",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Session 15 Layout Mini Project")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Flutter Learning Dashboard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("Review your Week 3 layout progress"),
                const SizedBox(height: 16),
                Row(
                  children: [
                    for (final stat in stats)
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                stat.value,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(stat.label),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: category.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category.icon, color: category.color, size: 32),
                          const SizedBox(height: 8),
                          Text(
                            category.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent Lessons',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];

                    return ListTile(
                      leading: Icon(lesson.icon),
                      title: Text(lesson.title),
                      subtitle: Text(lesson.subtitle),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        debugPrint("Selected ${lesson.title}");
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LearningCategory {
  const LearningCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}

const categories = [
  LearningCategory(name: 'Layout', icon: Icons.view_quilt, color: Colors.blue),
  LearningCategory(name: 'Lists', icon: Icons.list, color: Colors.green),
  LearningCategory(name: 'Grids', icon: Icons.grid_view, color: Colors.orange),
  LearningCategory(name: 'Debug', icon: Icons.bug_report, color: Colors.red),
];

class DashboardStat {
  const DashboardStat({required this.label, required this.value});

  final String label;
  final String value;
}

const stats = [
  DashboardStat(label: 'Sessions', value: '14'),
  DashboardStat(label: 'Weeks', value: '3'),
  DashboardStat(label: 'Phase', value: 'Beginner'),
];

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
    title: 'Session 11',
    subtitle: 'Row, Column, Padding, SizedBox',
    icon: Icons.view_column,
  ),
  Lesson(
    title: 'Session 12',
    subtitle: 'Expanded, Flexible, Constraints',
    icon: Icons.open_in_full,
  ),
  Lesson(title: 'Session 13', subtitle: 'ListView', icon: Icons.list),
  Lesson(
    title: 'Session 14',
    subtitle: 'GridView and SingleChildScrollView',
    icon: Icons.grid_view,
  ),
];
