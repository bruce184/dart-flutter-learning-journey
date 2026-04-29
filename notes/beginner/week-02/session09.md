Session: Session 9 - Split Widgets

Goal:
- Split a growing `main.dart` file into smaller files.
- Keep app startup code in `main.dart`.
- Move screen code into a `screens/` folder.
- Move reusable UI widgets into a `widgets/` folder.
- Practice importing local widget files.
- Understand parent-to-child data passing.

Output completed:
- Updated `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart` to keep only `main()` and `MyApp`.
- Created `lib/screens/home_page.dart` for `HomePage` and `_HomePageState`.
- Created `lib/widgets/session_title.dart` for `SessionTitle`.
- Created `lib/widgets/learning_text.dart` for the reusable `LearningText` widget from Session 7.
- Created `lib/widgets/counter_text.dart` for `CounterText`.
- Kept the counter state in `HomePage`.
- Passed `_counter` from `HomePage` into `CounterText` through the constructor.
- Ran `dart format lib` and `flutter analyze` successfully.

Evidence:
- Related project: `01_beginner/02_flutter_fundamentals/first_app`
- Main file: `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`
- Screen file: `01_beginner/02_flutter_fundamentals/first_app/lib/screens/home_page.dart`
- Widget files:
  - `01_beginner/02_flutter_fundamentals/first_app/lib/widgets/session_title.dart`
  - `01_beginner/02_flutter_fundamentals/first_app/lib/widgets/learning_text.dart`
  - `01_beginner/02_flutter_fundamentals/first_app/lib/widgets/counter_text.dart`
- Check result: `flutter analyze` reported `No issues found`.

What I understood:
- `main.dart` should stay focused on starting the app.
- Screen widgets can live in a `screens/` folder.
- Reusable UI pieces can live in a `widgets/` folder.
- `import` lets one Dart file use classes from another Dart file.
- `HomePage` is the parent widget that owns `_counter`.
- `CounterText` is a child widget that receives `counter` and displays it.
- `CounterText(counter: _counter)` passes data from parent to child.
- State should live in the closest widget that needs to own and change it.

What is still unclear:
- I should keep practicing when to split a widget into its own file.
- I need more examples of parent-to-child data and child-to-parent callbacks.

What I need to review next session:
- Basic debugging.
- Reading Flutter error messages.
- Using hot reload and hot restart intentionally.
