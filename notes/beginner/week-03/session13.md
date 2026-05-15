# Session 13 - ListView

## Goal

- Understand why a large `Column` can overflow vertically.
- Use `ListView` to show scrollable content.
- Use `ListView.builder` when the list has many or dynamic items.
- Build repeated list item UI without copying the same widget many times.
- Start thinking about data-driven UI: data list first, widget output second.

## Before Starting Session 13

Review these ideas from Sessions 11-12:

- `Column` arranges children vertically.
- `Row` arranges children horizontally.
- `Padding` and `SizedBox` control spacing.
- `Expanded` can give a widget the remaining space inside a `Column`.
- A layout can overflow when children need more space than the parent can give.

Session 13 answers this question:

- what should happen when a screen has more vertical content than can fit?

## 1. Why a Large `Column` Can Overflow

A `Column` tries to place all children vertically inside the available height.

Example:

```dart
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

This is fine for a few children.

But if the `Column` has many children, the screen may not have enough height. Flutter may show a vertical overflow warning.

Simple rule:

- use `Column` for a small fixed group of widgets
- use `ListView` for many items or content that should scroll

## 2. Basic `ListView`

`ListView` arranges children vertically and makes them scrollable.

Example:

```dart
ListView(
  children: const [
    ListTile(
      leading: Icon(Icons.book),
      title: Text('Session 1'),
      subtitle: Text('Environment setup'),
    ),
    ListTile(
      leading: Icon(Icons.code),
      title: Text('Session 2'),
      subtitle: Text('First Flutter app'),
    ),
  ],
)
```

Use this style when:

- the number of items is small
- you write the item widgets manually
- the content is mostly static

## 3. `ListTile`

`ListTile` is a convenient widget for common list rows.

Common parts:

- `leading`: widget on the left, often an `Icon` or `CircleAvatar`
- `title`: main text
- `subtitle`: smaller text below the title
- `trailing`: widget on the right, often an icon, number, or action
- `onTap`: callback when the row is tapped

Example:

```dart
ListTile(
  leading: const Icon(Icons.check_circle),
  title: const Text('Session 13'),
  subtitle: const Text('ListView'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    print('Tapped Session 13');
  },
)
```

## 4. `ListView.builder`

`ListView.builder` builds items from data.

Example:

```dart
final sessions = [
  'Environment setup',
  'First Flutter app',
  'Dart basics',
  'ListView',
];

ListView.builder(
  itemCount: sessions.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: Text('${index + 1}'),
      title: Text(sessions[index]),
    );
  },
)
```

Important pieces:

- `itemCount`: how many rows the list has
- `itemBuilder`: function that creates one row
- `index`: the position of the current item, starting from `0`

Use `ListView.builder` when:

- the list has many items
- the list comes from data
- the list may change later
- you do not want to copy-paste repeated widgets

## 5. Data-Driven UI

Instead of writing many `ListTile` widgets by hand, store the content in a list first.

Example:

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
  Lesson(
    title: 'Session 13',
    subtitle: 'ListView',
    icon: Icons.list,
  ),
];
```

Then build UI from that data:

```dart
ListView.builder(
  itemCount: lessons.length,
  itemBuilder: (context, index) {
    final lesson = lessons[index];

    return ListTile(
      leading: Icon(lesson.icon),
      title: Text(lesson.title),
      subtitle: Text(lesson.subtitle),
    );
  },
)
```

This habit becomes very important later when data comes from an API or database.

## 6. `ListView` Inside a `Column`

If a `ListView` is placed inside a `Column`, it often needs `Expanded`.

Correct:

```dart
Column(
  children: [
    const Text('Lessons'),
    Expanded(
      child: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return Text(lessons[index]);
        },
      ),
    ),
  ],
)
```

Reason:

- `Column` needs to know how much height the `ListView` should use
- `Expanded` gives the `ListView` the remaining vertical space

Common beginner mistake:

```dart
Column(
  children: [
    Text('Lessons'),
    ListView(...),
  ],
)
```

This can fail because the `ListView` wants scrollable height, but the `Column` does not give it a clear height.

## Common Beginner Mistakes

### 1. Using `Column` for a long list

If the content should scroll, use `ListView`.

### 2. Forgetting `itemCount`

Without `itemCount`, `ListView.builder` may try to build more items than your data has.

### 3. Forgetting that `index` starts from `0`

For display numbers, use:

```dart
index + 1
```

### 4. Putting `ListView` inside `Column` without `Expanded`

If the list is one section inside a larger vertical screen, wrap it with `Expanded`.

## Practice for This Session

Today, build a lesson list screen with:

- an app bar titled `Session 13 ListView`
- a small header at the top
- a scrollable list of beginner sessions
- `ListView.builder`
- `ListTile`
- a `Lesson` model class
- an `onTap` callback that prints the selected lesson

Use the guided exercise here:

- `01_beginner/03_layout_forms_navigation/exercises/session13/session13_listview.md`

## Output Completed

- Prepared Session 13 study note for Week 3.
- Added a guided hands-on exercise for `ListView`.
- Built the Session 13 `ListView.builder` practice app.
- Practiced `ListTile`, `itemCount`, `index`, `onTap`, and `debugPrint`.
- Observed why a `ListView` inside a `Column` needs `Expanded`.

## Evidence

- Related project: `01_beginner/03_layout_forms_navigation/`
- Practice file: `01_beginner/03_layout_forms_navigation/exercises/session13/session13_listview.md`

## What I Need to Understand By The End

- `Column` is for small fixed vertical groups.
- `ListView` is for scrollable vertical content.
- `ListView.builder` builds repeated rows from data.
- `itemCount` should usually match the data length.
- `index` starts at `0`.
- A `ListView` inside a `Column` often needs `Expanded`.

## What I Understood

- `ListView.builder` builds widgets from data instead of writing many `ListTile` widgets manually.
- `itemCount` tells Flutter how many list items should be built.
- `index` starts from `0`, so display numbers often use `index + 1`.
- `Expanded` gives a `ListView` inside a `Column` a clear remaining height.
- `Column` is better for small fixed vertical groups, while `ListView` is better for scrollable or repeated content.

## What I Need to Review Next Session

- `GridView`
- `SingleChildScrollView`
- choosing between list, grid, and general scrollable page layouts
