Session: Session 8 - StatefulWidget + setState

Goal:
- Understand the difference between `StatelessWidget` and `StatefulWidget`.
- Store mutable screen data inside a `State` class.
- Use `setState()` to tell Flutter to rebuild the UI after state changes.
- Practice a simple counter flow with a button.

Output completed:
- Updated `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`.
- Converted `HomePage` from `StatelessWidget` to `StatefulWidget`.
- Added `_HomePageState` to store mutable screen state.
- Added `_counter` as mutable state.
- Added `_incrementCounter()` to update `_counter`.
- Used `setState()` so the counter text updates on screen.
- Added an `ElevatedButton` that increases the counter when pressed.
- Ran `flutter analyze` successfully with no issues.

Evidence:
- Related project: `01_beginner/02_flutter_fundamentals/first_app`
- Main file: `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`
- Check result: `flutter analyze` reported `No issues found`.

What I understood:
- `StatefulWidget` is used when part of the UI depends on data that can change.
- Mutable data such as `_counter` belongs in the `State` class, not in the widget configuration class.
- `setState()` tells Flutter that the state changed and the widget should rebuild.
- If `_counter++` is called without `setState()`, the value can change, but the UI will not update correctly.
- `Text("Counter: $_counter")` cannot be `const` because it depends on a runtime value that changes.
- `$_counter` is Dart string interpolation, which inserts the current value of `_counter` into the string.

What is still unclear:
- I should keep practicing what belongs in the widget class and what belongs in the state class.
- I need more practice with multiple pieces of state on the same screen.

What I need to review next session:
- Splitting widgets cleanly.
- Passing data between parent and child widgets.
- Keeping screen code readable as UI grows.
