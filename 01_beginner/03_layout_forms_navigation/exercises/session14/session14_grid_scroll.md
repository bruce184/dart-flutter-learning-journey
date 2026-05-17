# Session 14 Exercise - GridView and SingleChildScrollView

## Objective

Build a category grid screen and practice:

- `GridView`
- `GridView.builder`
- `SliverGridDelegateWithFixedCrossAxisCount`
- `SingleChildScrollView`
- using `Expanded` when a scrollable widget is inside a `Column`
- choosing between `ListView`, `GridView`, and `SingleChildScrollView`

## Suggested Output

Create one screen with:

- an app bar titled `Session 14 Grid Scroll`
- a header section showing `Categories`
- a short subtitle
- a scrollable grid of category cards
- each card showing an icon, title, and soft background color
- 2 columns with clean spacing

## Create Project

From the repository root, create the practice app with:

```bash
cd "D:\1.UMT\1.SUBJECTS\3.JUNIOR\SEM9\MOBILE 3\flutter\01_beginner\03_layout_forms_navigation\exercises\session14"
flutter create session14_grid_scroll_app
cd session14_grid_scroll_app
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
        GridView.builder
          Container (category card)
            Column
              Icon
              SizedBox
              Text
```

## Build Steps

### Step 1

Start with a basic screen:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Session 14 Grid Scroll'),
  ),
  body: const Center(
    child: Text('Start here'),
  ),
)
```

### Step 2

Create a small model class:

```dart
class Category {
  const Category({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}
```

### Step 3

Create category data:

```dart
const categories = [
  Category(
    name: 'Food',
    icon: Icons.restaurant,
    color: Colors.orange,
  ),
  Category(
    name: 'Travel',
    icon: Icons.flight,
    color: Colors.blue,
  ),
  Category(
    name: 'Study',
    icon: Icons.school,
    color: Colors.green,
  ),
  Category(
    name: 'Sport',
    icon: Icons.sports_soccer,
    color: Colors.red,
  ),
  Category(
    name: 'Music',
    icon: Icons.music_note,
    color: Colors.purple,
  ),
  Category(
    name: 'Movie',
    icon: Icons.movie,
    color: Colors.indigo,
  ),
  Category(
    name: 'Book',
    icon: Icons.menu_book,
    color: Colors.brown,
  ),
  Category(
    name: 'Game',
    icon: Icons.sports_esports,
    color: Colors.teal,
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
            'Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text('Choose a topic to explore.'),
        ],
      ),
    ),
  ],
)
```

### Step 5

Add `Expanded` and `GridView.builder` below the header:

```dart
Expanded(
  child: GridView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: categories.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
    ),
    itemBuilder: (context, index) {
      final category = categories[index];

      return Container(
        decoration: BoxDecoration(
          color: category.color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 40,
              color: category.color,
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: category.color,
              ),
            ),
          ],
        ),
      );
    },
  ),
)
```

Goal:

- the header stays at the top
- the grid gets the remaining vertical space
- the grid can scroll when content is taller than the screen

### Step 6

Experiment with grid settings:

```dart
crossAxisCount: 3,
```

Try changing:

- `crossAxisCount`
- `crossAxisSpacing`
- `mainAxisSpacing`
- `childAspectRatio`

Observe how each one changes the layout.

### Step 7

Practice `SingleChildScrollView` separately.

Use it when you have one child, usually a `Column`, and the whole screen may need to scroll:

```dart
SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Profile'),
        SizedBox(height: 16),
        Text('Long content section 1'),
        SizedBox(height: 16),
        Text('Long content section 2'),
      ],
    ),
  ),
)
```

Use `SingleChildScrollView` for:

- profile screens
- detail screens
- forms
- pages with mixed content

Use `GridView.builder` for:

- many repeated items
- category grids
- product grids
- image galleries

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
        title: const Text('Session 14 Grid Scroll'),
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
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Choose a topic to explore.'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color: category.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category.icon,
                        size: 40,
                        color: category.color,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: category.color,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  const Category({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}

const categories = [
  Category(
    name: 'Food',
    icon: Icons.restaurant,
    color: Colors.orange,
  ),
  Category(
    name: 'Travel',
    icon: Icons.flight,
    color: Colors.blue,
  ),
  Category(
    name: 'Study',
    icon: Icons.school,
    color: Colors.green,
  ),
  Category(
    name: 'Sport',
    icon: Icons.sports_soccer,
    color: Colors.red,
  ),
  Category(
    name: 'Music',
    icon: Icons.music_note,
    color: Colors.purple,
  ),
  Category(
    name: 'Movie',
    icon: Icons.movie,
    color: Colors.indigo,
  ),
  Category(
    name: 'Book',
    icon: Icons.menu_book,
    color: Colors.brown,
  ),
  Category(
    name: 'Game',
    icon: Icons.sports_esports,
    color: Colors.teal,
  ),
];
```

## Common Mistake

This often causes a layout error:

```dart
Column(
  children: [
    Text('Categories'),
    GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Text(categories[index].name);
      },
    ),
  ],
)
```

Why?

`GridView` is scrollable. When it is inside a `Column`, Flutter needs to know how tall the grid should be.

Fix:

```dart
Expanded(
  child: GridView.builder(
    itemCount: categories.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) {
      return Text(categories[index].name);
    },
  ),
)
```

## Check Yourself

- How many direct children does `SingleChildScrollView` receive?
- When should you use `GridView` instead of `ListView`?
- What does `crossAxisCount` control?
- What does `childAspectRatio` control?
- Why do we wrap `GridView.builder` with `Expanded` inside a `Column`?
- When would `SingleChildScrollView` be a better choice than `GridView`?

## Next Step After This Exercise

After this session feels comfortable, continue to:

- form fields
- text input
- validation
- navigation between screens
