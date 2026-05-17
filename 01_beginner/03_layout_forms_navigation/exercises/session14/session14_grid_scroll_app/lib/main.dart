import 'package:flutter/material.dart';

void main() {
  runApp(const Session14GridScrollApp());
}

class Session14GridScrollApp extends StatelessWidget {
  const Session14GridScrollApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: "Session 14: Grid Scroll",
      home: const CategoryGridPage()
    );
  }
}

class CategoryGridPage extends StatelessWidget {
  const CategoryGridPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"name": "Food", "icon": Icons.restaurant, "color": Colors.orange},
    {"name": "Travel", "icon": Icons.flight, "color": Colors.blue},
    {"name": "Study", "icon": Icons.school, "color": Colors.green},
    {"name": "Sport", "icon": Icons.sports_soccer, "color": Colors.red},
    {"name": "Music", "icon": Icons.music_note, "color": Colors.purple},
    {"name": "Movie", "icon": Icons.movie, "color": Colors.indigo},
    {"name": "Book", "icon": Icons.menu_book, "color": Colors.brown},
    {"name": "Game", "icon": Icons.sports_esports, "color": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session 14"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: category['color'].withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'],
                          size: 40,
                          color: category['color'],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
