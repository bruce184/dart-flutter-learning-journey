# Session 15 Exercise - Layout Mini Project

## Objective

Build a small learning dashboard and review:

- `Column`
- `Row`
- `Padding`
- `SizedBox`
- `Expanded`
- `ListView.builder`
- `GridView.builder`
- simple model classes
- choosing the right layout widget

## Suggested Output

Create one screen with:

- an app bar titled `Session 15 Mini Project`
- a header section showing `Flutter Learning Dashboard`
- a short subtitle
- a stats row with three small stats
- a category grid with 2 columns
- a recent lessons list below the grid

## Create Project

From the repository root, create the practice app with:

```powershell
cd "D:\1.UMT\1.SUBJECTS\3.JUNIOR\SEM9\MOBILE 3\flutter\01_beginner\03_layout_forms_navigation\exercises\session15"
flutter create session15_layout_mini_project_app
cd session15_layout_mini_project_app
```

Then build the exercise mainly in:

```text
lib/main.dart
```

## Widget Tree Target

```text
Scaffold
  AppBar
  body
    Column
      Padding
        Column (header + stats)
      Expanded
        ListView
          Padding
            Column
              Text (Categories)
              GridView.builder
              Text (Recent Lessons)
              ListView.builder
```

## Important Layout Choice

This mini project has mixed content:

- header
- stats
- grid section
- list section

Because the lower content is mixed, one beginner-friendly approach is:

```dart
Expanded(
  child: ListView(
    children: [
      // grid section
      // lesson list section
    ],
  ),
)
```

When a `GridView.builder` or `ListView.builder` is placed inside another scrollable widget, give it:

```dart
shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
```

This lets the outer `ListView` handle scrolling.

## Step 1 - Basic App Shell

Start with:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session 15 Mini Project'),
      ),
      body: const Center(
        child: Text('Start here'),
      ),
    );
  }
}
```

## Step 2 - Add Models

Create a model for stats:

```dart
class DashboardStat {
  const DashboardStat({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}
```

Create a model for categories:

```dart
class LearningCategory {
  const LearningCategory({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;
}
```

Create a model for lessons:

```dart
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
```

## Step 3 - Add Data

Use small lists of data:

```dart
const stats = [
  DashboardStat(label: 'Sessions', value: '14'),
  DashboardStat(label: 'Weeks', value: '3'),
  DashboardStat(label: 'Phase', value: 'Beginner'),
];
```

```dart
const categories = [
  LearningCategory(title: 'Layout', icon: Icons.view_quilt, color: Colors.blue),
  LearningCategory(title: 'Lists', icon: Icons.list, color: Colors.green),
  LearningCategory(title: 'Grids', icon: Icons.grid_view, color: Colors.orange),
  LearningCategory(title: 'Debug', icon: Icons.bug_report, color: Colors.red),
];
```

```dart
const lessons = [
  Lesson(title: 'Session 11', subtitle: 'Row, Column, Padding, SizedBox', icon: Icons.view_column),
  Lesson(title: 'Session 12', subtitle: 'Expanded, Flexible, Constraints', icon: Icons.open_in_full),
  Lesson(title: 'Session 13', subtitle: 'ListView', icon: Icons.list),
  Lesson(title: 'Session 14', subtitle: 'GridView and SingleChildScrollView', icon: Icons.grid_view),
];
```

## Step 4 - Build The Page Structure

Replace the body with:

```dart
body: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Flutter Learning Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Review your Week 3 layout progress.'),
          const SizedBox(height: 16),
          Row(
            children: [
              // stat cards
            ],
          ),
        ],
      ),
    ),
    Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // category grid
          // recent lessons list
        ],
      ),
    ),
  ],
)
```

## Step 5 - Build Stat Cards

Inside the `Row`, use:

```dart
for (final stat in stats)
  Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            stat.value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(stat.label),
        ],
      ),
    ),
  ),
```

## Step 6 - Build Category Grid

Inside the outer `ListView`, add:

```dart
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
        color: category.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, color: category.color, size: 32),
          const SizedBox(height: 8),
          Text(
            category.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  },
),
```

## Step 7 - Build Recent Lessons

Below the grid, add:

```dart
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
        debugPrint('Selected ${lesson.title}');
      },
    );
  },
),
```

## Check Yourself

- Why does the outer `ListView` handle scrolling?
- Why do the inner `GridView.builder` and `ListView.builder` use `shrinkWrap: true`?
- Why do the inner builders use `NeverScrollableScrollPhysics()`?
- Which parts use `Row`?
- Which parts use `Column`?
- Which parts use `Expanded`?
- Which repeated UI sections are built from data?

## Completion Criteria

You can mark Session 15 complete when:

- the app runs
- the dashboard shows header, stats, categories, and recent lessons
- no layout overflow appears
- `flutter analyze` has no issues
- you can explain why each scrollable widget was chosen

