Session: Session 6 - Flutter Mindset

Goal:
- Understand Flutter UI as a widget tree.
- Review the roles of `main()`, `runApp()`, `MaterialApp`, and `Scaffold`.
- Practice building a simple screen with `AppBar`, `Center`, `Column`, and `Text`.
- Understand basic `Column` alignment with `mainAxisAlignment` and `crossAxisAlignment`.

Output completed:
- Updated `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`.
- Built a Session 6 screen with `MaterialApp`, `Scaffold`, `AppBar`, `Center`, and `Column`.
- Added four text widgets:
  - `Flutter Mindset`
  - `Everything is a Widget`
  - `UI is built as a Widget Tree`
  - `I can read a Widget Tree`
- Practiced changing `crossAxisAlignment` between `center`, `start`, and `end`.
- Ran `flutter analyze` successfully with no issues.

Evidence:
- Related project: `01_beginner/02_flutter_fundamentals/first_app`
- Main file: `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`
- Check result: `flutter analyze` reported `No issues found`.

What I understood:
- `main()` is the entry point of the Dart program.
- `runApp()` receives the root widget and attaches it to the screen.
- `MyApp` is the root widget because it is passed to `runApp()`.
- `MaterialApp` is the high-level app shell.
- `Scaffold` provides the structure for one screen.
- Flutter UI is built by composing widgets into a widget tree.
- For `Column`, `mainAxisAlignment` controls the vertical axis.
- For `Column`, `crossAxisAlignment` controls the horizontal axis.

What is still unclear:
- I should keep practicing when a widget should be extracted into its own class.
- I need more practice reading deeper widget trees without getting lost.

What I need to review next session:
- `StatelessWidget`.
- The role of the `build()` method.
- When and why Flutter rebuilds widgets.
