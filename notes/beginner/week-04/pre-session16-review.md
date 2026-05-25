# Pre-Session 16 Review - Sessions 1-15

## Goal

Review the foundation from Sessions 1-15 before starting Session 16: `TextField` / `TextFormField`.

This review covers:

- Dart basics
- Flutter app structure
- widgets and state
- splitting files
- debugging
- layout and scrollable widgets
- Session 15 layout mini project decisions

## Current Progress

- Phase: Beginner
- Completed: Sessions 1-15
- Next session: Session 16 - `TextField` / `TextFormField`
- Beginner progress: 15 / 30 sessions

## Checkpoint 1 - Dart and Setup

Reviewed:

- `flutter doctor` checks the machine setup: Flutter SDK, Dart SDK, tools, devices, and development environment.
- `main()` is the Dart entry point.
- `runApp()` attaches the root widget to the Flutter framework.
- `MaterialApp` is the app shell for Material apps.
- `Scaffold` provides the structure for one screen, such as `appBar` and `body`.
- `var` lets Dart infer the type.
- `final` is assigned once and can be known at runtime.
- `const` must be known at compile time.
- `String? name` means `name` can be a `String` or `null`.

Important corrections:

- `?.` safely accesses a property or method only when the value is not `null`.
- `!` does not make a value safe; it tells Dart to trust that the value is not `null`. If the value is actually `null`, the app can crash at runtime.
- `Future` is a result that will be available later, not a function.
- `async` marks a function that can use `await`.
- `await` waits for a `Future` to finish before continuing.

## Checkpoint 2 - Widgets and State

Reviewed:

- Flutter UI is built from nested widgets.
- `build(BuildContext context)` describes the UI a widget wants to display.
- `StatelessWidget` is used when the widget only receives configuration and does not own mutable state.
- Fields in a `StatelessWidget` are usually `final`.
- `required this.text` means the constructor must receive `text` and assign it to the field.
- `StatefulWidget` is used when UI depends on data that can change while the app runs.
- Mutable state belongs in the `State` class, such as `_HomePageState`.
- If multiple child widgets need the same state, keep the state in the nearest parent that owns it.
- `setState()` tells Flutter that state changed and the widget should rebuild.
- Updating `_counter` without `setState()` changes the value but does not update the UI.
- Runtime values such as `_counter` cannot be used inside `const` widgets.

## Checkpoint 3 - Split Widgets and Debugging

Reviewed:

- `main.dart` should stay focused on startup and root app setup.
- `screens/` contains app screens.
- `widgets/` contains reusable UI pieces.
- Parent widgets pass data to child widgets through constructor parameters.

Example:

```dart
CounterText(counter: _counter)
```

Meaning:

- `HomePage` owns `_counter`.
- `CounterText` receives `counter`.
- `CounterText` displays the value.

Debugging reminders:

- `flutter analyze` checks project code.
- `flutter doctor` checks the machine and environment.
- Compile-time errors happen before the app runs.
- Runtime errors happen while the app is running.
- Error format like `lib/screens/home_page.dart:35:26` means file, line, and column.
- `CounterText(counter: '5')` is wrong when `counter` expects an `int`.
- `onPressed: _incrementCounter()` calls the function too early.
- Use `onPressed: _incrementCounter` or a callback block instead.

## Checkpoint 4 - Layout Basics

Reviewed:

- `Column` arranges children vertically.
- `Row` arranges children horizontally.
- In a `Column`, `mainAxisAlignment` controls the vertical axis.
- In a `Column`, `crossAxisAlignment` controls the horizontal axis.
- In a `Row`, `mainAxisAlignment` controls the horizontal axis.
- In a `Row`, `crossAxisAlignment` controls the vertical axis.
- `Padding` adds space around a widget.
- `SizedBox` creates fixed gaps or fixed-size areas.
- `child` receives one widget.
- `children` receives a list of widgets.

Example widget tree:

```text
Scaffold
  body: Center
    Padding
      Column
        Text
        SizedBox
        Text
```

## Checkpoint 5 - Constraints, Expanded, and Flexible

Reviewed:

- Flutter layout works through constraints: a parent gives size rules, the child chooses a size within those rules, then the parent places the child.
- A `Row` can overflow when children need more width than available.
- `Expanded` forces a child to fill the remaining space in a `Row`, `Column`, or `Flex`.
- `Expanded` inside a `Row` shares horizontal space.
- `Expanded` inside a `Column` shares vertical space.
- `flex: 2` and `flex: 1` divide available space into 3 parts.
- `Flexible` lets a child use available space without forcing it to fill all of it.
- `Expanded` must be inside `Row`, `Column`, or `Flex`.

Correct overflow fix:

```dart
Row(
  children: const [
    Icon(Icons.person),
    SizedBox(width: 8),
    Expanded(
      child: Text('A very very very long user name'),
    ),
  ],
)
```

## Checkpoint 6 - ListView, GridView, and Scroll

Reviewed:

- Use `Column` for a small fixed group of vertical widgets.
- Use `ListView` for many vertical widgets or scrollable content.
- Use `ListView.builder` when repeated rows come from data.
- `itemCount` tells Flutter how many items to build.
- `index` starts at `0`.
- Display numbers often use `index + 1`.
- `ListTile` commonly uses `leading`, `title`, `subtitle`, `trailing`, and `onTap`.
- A `ListView` inside a `Column` usually needs `Expanded`.
- Use `GridView` when items should appear in multiple columns.
- `crossAxisCount` controls how many columns the grid has.
- `crossAxisSpacing` controls horizontal spacing between grid items.
- `mainAxisSpacing` controls vertical spacing between grid items.
- `childAspectRatio` controls each item's width-to-height ratio.
- `SingleChildScrollView` receives one direct child, often a `Column`.

Choosing scroll widgets:

- `ListView.builder`: many repeated items of the same type.
- `GridView.builder`: repeated items in rows and columns.
- `SingleChildScrollView + Column`: mixed content pages such as profile, detail, or form screens.

## Checkpoint 7 - Session 15 Mini Project

Reviewed:

- Session 15 used a learning dashboard to combine Week 3 layout skills.
- The lower page used an outer `ListView` because it had mixed content: category grid and recent lessons.
- Inner `GridView.builder` and `ListView.builder` used `shrinkWrap: true` so they could size themselves based on content.
- Inner scrollables used `NeverScrollableScrollPhysics()` so the outer `ListView` handled scrolling.
- The stats row used `Row` and `Expanded` to divide horizontal space evenly.
- Repeated UI was built from data lists to avoid copy-paste and prepare for API/database-driven UI later.

Memory rules:

```text
ListView/GridView inside Column -> often needs Expanded.
Grid/List inside outer scroll -> shrinkWrap true + NeverScrollableScrollPhysics.
Mixed content page -> SingleChildScrollView or outer ListView.
Repeated UI -> build from data.
```

## Readiness For Session 16

Ready to start:

- `TextField`
- `TextFormField`
- basic input state
- form layout with `Column`, `Padding`, and scroll behavior

Things to keep watching:

- `child` vs `children`
- `Expanded` placement
- nullable values and `!`
- `const` only for values known at compile time
- choosing the correct scrollable widget

