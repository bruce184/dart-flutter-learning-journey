# Session 13 Exercise - ListView

## Objective

Build a scrollable lesson list screen and practice:

- `ListView`
- `ListView.builder`
- `ListTile`
- list data
- `index`
- using `Expanded` when a `ListView` is inside a `Column`

## Suggested Output

Create one screen with:

- an app bar titled `Session 13 ListView`
- a header section showing `Beginner Sessions`
- a short subtitle
- a scrollable list of sessions
- each row showing icon, title, subtitle, and a right arrow
- a tap action that prints the selected session title

## Create Project

From the repository root, create the practice app with:

```bash
cd /Users/mickeynguyen/Development/Bruce/MOBILE3/flutter/01_beginner/03_layout_forms_navigation/exercises/session13
flutter create session13_listview_app
cd session13_listview_app
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
        Column (header)
      Expanded
        ListView.builder
          ListTile
```

## Build Steps

### Step 1

Start with a basic screen:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Session 13 ListView'),
  ),
  body: const Center(
    child: Text('Start here'),
  ),
)
```

### Step 2

Create a small model class:

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

### Step 3

Create lesson data:

```dart
const lessons = [
  Lesson(
    title: 'Session 1',
    subtitle: 'Environment setup',
    icon: Icons.settings,
  ),
  Lesson(
    title: 'Session 2',
    subtitle: 'First Flutter app',
    icon: Icons.phone_android,
  ),
  Lesson(
    title: 'Session 3',
    subtitle: 'Dart basics 1',
    icon: Icons.code,
  ),
  Lesson(
    title: 'Session 4',
    subtitle: 'Dart basics 2',
    icon: Icons.data_array,
  ),
  Lesson(
    title: 'Session 5',
    subtitle: 'OOP, async, and mini CLI',
    icon: Icons.school,
  ),
  Lesson(
    title: 'Session 6',
    subtitle: 'Flutter mindset',
    icon: Icons.account_tree,
  ),
  Lesson(
    title: 'Session 7',
    subtitle: 'StatelessWidget',
    icon: Icons.widgets,
  ),
  Lesson(
    title: 'Session 8',
    subtitle: 'StatefulWidget and setState',
    icon: Icons.touch_app,
  ),
  Lesson(
    title: 'Session 9',
    subtitle: 'Split widgets',
    icon: Icons.folder,
  ),
  Lesson(
    title: 'Session 10',
    subtitle: 'Basic debugging',
    icon: Icons.bug_report,
  ),
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
  Lesson(
    title: 'Session 13',
    subtitle: 'ListView',
    icon: Icons.list,
  ),
];
```

### Step 4

Replace the `Center` body with a `Column`.

Add a header first:

```dart
body: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Beginner Sessions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Review your completed Flutter learning path.'),
        ],
      ),
    ),
  ],
)
```

### Step 5

Add `Expanded` and `ListView.builder` below the header:

```dart
Expanded(
  child: ListView.builder(
    itemCount: lessons.length,
    itemBuilder: (context, index) {
      final lesson = lessons[index];

      return ListTile(
        leading: Icon(lesson.icon),
        title: Text(lesson.title),
        subtitle: Text(lesson.subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          print('Selected ${lesson.title}');
        },
      );
    },
  ),
)
```

Goal:

- the header stays at the top
- the list gets the remaining vertical space
- the list can scroll when content is taller than the screen

### Step 6

Improve the row spacing by adding a divider:

```dart
return Column(
  children: [
    ListTile(
      leading: Icon(lesson.icon),
      title: Text(lesson.title),
      subtitle: Text(lesson.subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        print('Selected ${lesson.title}');
      },
    ),
    const Divider(height: 1),
  ],
);
```

## Starter Snippet

Use this only if you get stuck. Try the steps above first.

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
        title: const Text('Session 13 ListView'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Beginner Sessions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Review your completed Flutter learning path.'),
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
                      leading: Icon(lesson.icon),
                      title: Text(lesson.title),
                      subtitle: Text(lesson.subtitle),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        print('Selected ${lesson.title}');
                      },
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
    title: 'Session 1',
    subtitle: 'Environment setup',
    icon: Icons.settings,
  ),
  Lesson(
    title: 'Session 2',
    subtitle: 'First Flutter app',
    icon: Icons.phone_android,
  ),
  Lesson(
    title: 'Session 3',
    subtitle: 'Dart basics 1',
    icon: Icons.code,
  ),
  Lesson(
    title: 'Session 4',
    subtitle: 'Dart basics 2',
    icon: Icons.data_array,
  ),
  Lesson(
    title: 'Session 5',
    subtitle: 'OOP, async, and mini CLI',
    icon: Icons.school,
  ),
  Lesson(
    title: 'Session 6',
    subtitle: 'Flutter mindset',
    icon: Icons.account_tree,
  ),
  Lesson(
    title: 'Session 7',
    subtitle: 'StatelessWidget',
    icon: Icons.widgets,
  ),
  Lesson(
    title: 'Session 8',
    subtitle: 'StatefulWidget and setState',
    icon: Icons.touch_app,
  ),
  Lesson(
    title: 'Session 9',
    subtitle: 'Split widgets',
    icon: Icons.folder,
  ),
  Lesson(
    title: 'Session 10',
    subtitle: 'Basic debugging',
    icon: Icons.bug_report,
  ),
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
  Lesson(
    title: 'Session 13',
    subtitle: 'ListView',
    icon: Icons.list,
  ),
];
```

## Check Yourself

- Why can a large `Column` overflow vertically?
- What does `ListView` add that `Column` does not?
- What does `itemCount` do?
- What is the first value of `index`?
- Why do we wrap `ListView.builder` with `Expanded` inside a `Column`?

