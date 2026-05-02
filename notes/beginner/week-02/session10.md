# Session 10 - Basic Debugging

## Before Starting Session 10

The goal before starting Session 10 is to review Sessions 1-9 carefully:

- Flutter environment setup
- Dart basics
- Flutter widget tree
- `StatelessWidget`
- `StatefulWidget`
- `setState`
- Splitting files and passing data from parent widgets to child widgets

## Review Sessions 1-9

### 1. Environment Setup

Key points:

- `flutter doctor` is used to check the Flutter development environment.
- VS Code should have the Flutter extension and Dart extension installed.
- Major environment issues should be fixed before building apps.

### 2. First Flutter App

Key points:

- `main()` is the starting point of a Dart program.
- `runApp()` runs the root widget of the app.
- `MaterialApp` is the outer app shell.
- `Scaffold` is the structure for one screen.
- `AppBar`, `body`, `Center`, `Column`, and `Text` are basic Flutter widgets.
- Hot reload updates the UI quickly and usually keeps the current state.
- Hot restart reruns the app more fully, almost from the beginning.

### 3. Dart Variables, Types, and Null Safety

Key points:

- `var`: Dart infers the type.
- `final`: assigned once. The value can be calculated at runtime.
- `const`: compile-time constant. The value must be known before the program runs.
- `String? name`: `name` can be either a `String` or `null`.

Example:

```dart
final now = DateTime.now();
const appName = 'My Flutter App';

String? email;
print(email ?? 'No email');
```

### 4. Null-Aware Operators

Key points:

- `??`: use a fallback value if the left side is `null`.
- `?.`: safely access a property or method when a value may be `null`.
- `!`: tell Dart that the value is definitely not `null`.

Example:

```dart
String? name = 'Long';

print(name ?? 'No name');
print(name?.length);
print(name!.length);
```

Important:

- Use `!` carefully. If the value is actually `null`, the app will get a runtime error.

### 5. List, Map, and Set

Key points:

- `List`: an ordered collection. Duplicate values are allowed.
- `Map`: data stored as `key-value` pairs.
- `Set`: a collection of unique values. Duplicate values are removed.

Example:

```dart
List<String> names = ['An', 'Binh', 'An'];

Map<String, int> scores = {
  'An': 8,
  'Binh': 9,
};

Set<String> uniqueNames = {'An', 'Binh', 'An'};
```

### 6. Class, Object, Constructor, and Method

Key points:

- A class is a blueprint.
- An object is a real value created from a class.
- A constructor defines how an object is created.
- A method is a function that belongs to a class.

Example:

```dart
class Student {
  Student({
    required this.name,
    required this.age,
    required this.score,
  });

  final String name;
  final int age;
  final double score;

  bool isPassed() {
    return score >= 5;
  }
}

final student = Student(name: 'An', age: 20, score: 8.5);
print(student.isPassed());
```

### 7. List<Student> vs List<Map<String, dynamic>>

Use `List<Student>` when the data has a clear structure:

```dart
List<Student> students = [
  Student(name: 'An', age: 20, score: 8.5),
];
```

Use `List<Map<String, dynamic>>` when the data is still flexible, often when receiving JSON/API data:

```dart
List<Map<String, dynamic>> students = [
  {'name': 'An', 'age': 20, 'score': 8.5},
];
```

Remember:

- `List<Student>` is cleaner, safer, and better for serious app code.
- `List<Map<String, dynamic>>` is quick and flexible, but it is easier to make mistakes with keys or data types.

### 8. Future, async, and await

Key points:

- `Future`: a result that will be available later.
- `async`: marks a function that contains asynchronous work.
- `await`: waits for a `Future` to finish and then gets the result.

Example:

```dart
Future<String> loadName() async {
  await Future.delayed(Duration(seconds: 1));
  return 'An';
}
```

Common use cases:

- Calling an API
- Reading a file
- Reading from a database
- Waiting for a task that takes time

### 9. StatelessWidget

Key points:

- `StatelessWidget` is used when a widget only receives configuration and displays UI.
- Configuration should be stored in `final` fields.
- `required this.text` means the caller must pass the `text` value.

Example:

```dart
class LearningText extends StatelessWidget {
  const LearningText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
```

### 10. StatefulWidget and setState

Key points:

- `StatefulWidget` is used when the UI depends on data that can change.
- Mutable state should live inside the `State` class.
- `setState()` tells Flutter that the state changed and the UI needs to rebuild.

Example:

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $_counter');
  }
}
```

If you only call `_counter++` without calling `setState()`, the value may change, but the UI is not told to update.

### 11. const and Runtime Values

Do not write:

```dart
const Text('Counter: $_counter');
```

Reason:

- `_counter` changes while the app is running.
- `const` is only for values known at compile time.

Write this instead:

```dart
Text('Counter: $_counter');
```

### 12. Splitting Widgets

Key points:

- `main.dart` should stay small: `main()` and the root app.
- Screens should be placed in `lib/screens/`.
- Reusable widgets should be placed in `lib/widgets/`.
- A parent widget can pass data to a child widget through the constructor.

Example:

```dart
CounterText(counter: _counter)
```

In this example:

- `HomePage` is the parent and owns `_counter`.
- `CounterText` is the child and only displays the value it receives.

State should live in the parent widget if multiple child widgets need to share that state.

## Readiness Check

You already understand these points well:

- `String?` is used when a value can be `null`.
- `main()` is the starting point of the program.
- `runApp()` runs the root widget.
- `MaterialApp` is the outer app shell.
- `Scaffold` is the structure of one screen.
- `StatefulWidget` is needed for a button that changes a counter.
- `setState()` is needed to update the UI after state changes.
- State should live in the parent if multiple child widgets need it.
- Splitting files makes code easier to read and manage.

Points to keep reviewing:

- `final` vs `const`
- `??`, `?.`, and `!`
- `Future`, `async`, and `await`
- When to use `List<Student>` instead of `List<Map<String, dynamic>>`

## Session 10 Goal

After the review, Session 10 will focus on basic debugging:

- Read Flutter/Dart errors calmly.
- Understand the difference between compile-time errors and runtime errors.
- Use `flutter analyze`.
- Know when to use hot reload, hot restart, or stop/run again.
- Fix common beginner errors:
  - Missing imports
  - Wrong variable names
  - Missing `required` values
  - Incorrect `const` usage
  - Null safety errors

## Opening Question

When a Flutter app shows a red error in the terminal, the first things to do are:

1. Read the first meaningful error line.
2. Find the file name and line number.
3. Check whether the error is related to syntax, type, import, null safety, or runtime behavior.
4. Fix one small error first, then run/analyze again.

## Compile-Time Error vs Runtime Error

### Compile-Time Error

A compile-time error happens before the app runs.

Dart reads the code and finds a problem, so the app cannot build or run.

Common compile-time errors:

- Syntax error
- Wrong type
- Missing import
- Missing required argument
- Incorrect `const` usage
- Calling a variable, class, or function that does not exist

Examples:

```dart
final int score = '10';
```

Problem:

- `score` expects an `int`.
- `'10'` is a `String`.

```dart
CounterText(counter: '5');
```

Problem:

- `CounterText` expects an `int`.
- `'5'` is a `String`.

```dart
const SessionTitle();
```

Problem:

- `SessionTitle` requires `text`.

### Runtime Error

A runtime error happens while the app is running.

The code may pass the initial check, but it fails when a real value or real situation happens.

Common runtime errors:

- A value is actually `null`.
- A list index does not exist.
- API request fails.
- File/database data is missing.
- A value exists in a different shape than expected.

Examples:

```dart
String? email;
print(email!.length);
```

Problem:

- Dart allows this because `!` tells Dart that `email` is not null.
- At runtime, `email` is actually `null`, so the app crashes.

```dart
List<String> names = ['An', 'Binh'];
print(names[5]);
```

Problem:

- Dart allows the code because `5` is a valid integer index type.
- At runtime, the list only has two items, so index `5` does not exist.

Easy memory rule:

```text
compile-time error = Dart stops the app before it runs
runtime error = the app starts, then fails while running
```

## Reading Error Messages

Flutter/Dart errors often show this pattern:

```text
file_path:line:column: Error: message
```

Example:

```text
lib/screens/home_page.dart:35:26: Error: The argument type 'String' can't be assigned to the parameter type 'int'.
            CounterText(counter: "5"),
                         ^
```

Read it as:

```text
File: lib/screens/home_page.dart
Line: 35
Column: 26
Problem: String cannot be assigned to int
Fix: pass an int instead of a String
```

Correct code:

```dart
CounterText(counter: 5)
```

Or in the counter app:

```dart
CounterText(counter: _counter)
```

### Error vs Context

Sometimes Dart prints an error and then a context line.

Example:

```text
lib/screens/home_page.dart:38:24: Error: Constant evaluation error:
            const CounterText(counter: _counter),
                                      ^
lib/screens/home_page.dart:38:39: Context: The variable '_counter' is not a constant.
            const CounterText(counter: _counter),
                                           ^
```

Meaning:

- The first line is the main error.
- The `Context` line explains why the error happened.

Problem:

- `const CounterText(...)` requires all arguments to be compile-time constants.
- `_counter` is runtime state, so it is not constant.

Fix:

```dart
CounterText(counter: _counter)
```

## Common Beginner Debugging Cases

### 1. Missing Required Argument

Wrong:

```dart
const SessionTitle();
```

Problem:

- `SessionTitle` requires `text`.

Fix:

```dart
const SessionTitle(text: 'Session 10')
```

### 2. Wrong Type

Wrong:

```dart
CounterText(counter: '5');
```

Problem:

- `counter` expects `int`.
- `'5'` is `String`.

Fix:

```dart
CounterText(counter: 5)
```

### 3. const with Runtime State

Wrong:

```dart
const CounterText(counter: _counter);
```

Problem:

- `_counter` changes while the app is running.
- `const` requires compile-time values.

Fix:

```dart
CounterText(counter: _counter)
```

### 4. Calling a Callback Too Early

Wrong:

```dart
ElevatedButton(
  onPressed: _incrementCounter(),
  child: const Text('Increase Counter'),
)
```

Problem:

- `_incrementCounter()` calls the function immediately.
- `onPressed` needs a function to call later.
- `_incrementCounter()` returns `void`, so Dart reports that `void` cannot be used.

Fix:

```dart
ElevatedButton(
  onPressed: _incrementCounter,
  child: const Text('Increase Counter'),
)
```

Also valid:

```dart
ElevatedButton(
  onPressed: () {
    _incrementCounter();
  },
  child: const Text('Increase Counter'),
)
```

Use the second style when the button should do more than one thing:

```dart
onPressed: () {
  _incrementCounter();
  print('Button pressed');
}
```

### 5. Missing Import

Problem example:

```dart
Text('Hello');
```

If the file does not import Material:

```dart
import 'package:flutter/material.dart';
```

Dart does not know what `Text` is.

Fix:

```dart
import 'package:flutter/material.dart';
```

## Hot Reload, Hot Restart, and Stop/Run Again

Use hot reload for small UI/code changes:

- Change text
- Change color
- Change simple layout
- Change widget styling

Use hot restart when you want to reset app state:

- You changed the initial state value.
- You want `_counter` to start again from its initial value.
- The app has a strange state after many interactions.

Use stop/run again when startup, packages, or configuration changed:

- Added a package in `pubspec.yaml`
- Changed app startup logic in `main()`
- Changed platform/native configuration
- Hot restart is not enough

Memory rule:

```text
small UI change -> hot reload
reset state -> hot restart
package/config/startup change -> stop/run again
```

## Important Flutter Commands

### Check Project Code

```powershell
flutter analyze
```

Use this to check Dart/Flutter code issues without running the app.

### Format Dart Code

```powershell
dart format lib
```

Use this to automatically format Dart files in `lib`.

### Download Packages

```powershell
flutter pub get
```

Use this after editing `pubspec.yaml`.

### Run the App

```powershell
flutter run
```

Use this to start the app on a device, emulator, or browser.

### Check Flutter Environment

```powershell
flutter doctor
```

Use this to check the machine setup, Flutter SDK, devices, and environment.

Memory rule:

```text
flutter analyze = check my project
flutter doctor = check my computer
```

## Session 10 Final Understanding

By the end of this session, I should be able to:

- Tell whether an error is compile-time or runtime.
- Read `file:line:column` in an error message.
- Find the main error message instead of reading the whole terminal output randomly.
- Understand when a `Context` line explains the real reason for an error.
- Fix missing required arguments.
- Fix wrong type errors.
- Remove `const` when a widget receives runtime state.
- Pass a callback function correctly to `onPressed`.
- Choose between hot reload, hot restart, and stop/run again.
- Use `flutter analyze`, `dart format lib`, `flutter pub get`, `flutter run`, and `flutter doctor`.
