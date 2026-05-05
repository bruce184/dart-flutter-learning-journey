# Session 11 - Row, Column, Padding, SizedBox

## Goal

- Understand how Flutter arranges widgets vertically and horizontally.
- Use `Column` to stack widgets from top to bottom.
- Use `Row` to place widgets from left to right.
- Use `Padding` to create space around widgets.
- Use `SizedBox` to create fixed gaps or fixed size areas.
- Start reading layout code as a widget tree instead of separate lines.

## Before Starting Session 11

Review these ideas from Sessions 6-10:

- widget tree
- `Scaffold`, `AppBar`, `Center`
- `StatelessWidget` and `StatefulWidget`
- splitting UI into smaller widgets

You do not need advanced state for this session. The main focus is visual structure.

## 1. `Column`

`Column` arranges children vertically.

Example:

```dart
Column(
  children: [
    Text('Name'),
    Text('Role'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Follow'),
    ),
  ],
)
```

Think of it as:

- first child on top
- next child below it
- next child below that

Useful properties:

- `mainAxisAlignment`: controls vertical distribution in a `Column`
- `crossAxisAlignment`: controls horizontal alignment in a `Column`

## 2. `Row`

`Row` arranges children horizontally.

Example:

```dart
Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 8),
    Text('Featured'),
  ],
)
```

Think of it as:

- first child on the left
- next child to the right
- next child to the right again

Useful properties:

- `mainAxisAlignment`: controls horizontal distribution in a `Row`
- `crossAxisAlignment`: controls vertical alignment in a `Row`

## 3. Main Axis vs Cross Axis

This is one of the most important layout ideas in Flutter.

For `Column`:

- main axis = vertical
- cross axis = horizontal

For `Row`:

- main axis = horizontal
- cross axis = vertical

Example:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Flutter'),
    Text('Layout Basics'),
  ],
)
```

Meaning:

- children are centered vertically inside the available height
- text starts from the left side horizontally

## 4. `Padding`

`Padding` adds space around a widget.

Example:

```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Hello'),
)
```

Common styles:

- `EdgeInsets.all(16)`
- `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`
- `EdgeInsets.only(top: 24, left: 16)`

Use `Padding` when a widget should not touch the screen edge or nearby widgets.

## 5. `SizedBox`

`SizedBox` is a very common tool for fixed spacing.

Example:

```dart
Column(
  children: [
    Text('Title'),
    SizedBox(height: 12),
    Text('Subtitle'),
  ],
)
```

You can also give it a width or height:

```dart
SizedBox(
  width: 120,
  height: 48,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Save'),
  ),
)
```

Use `SizedBox` for:

- vertical gaps in `Column`
- horizontal gaps in `Row`
- simple fixed-size areas

## 6. A Small Widget Tree Example

```dart
Scaffold(
  appBar: AppBar(title: Text('Session 11')),
  body: Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('My Profile'),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite),
              SizedBox(width: 8),
              Text('Learning Flutter'),
            ],
          ),
        ],
      ),
    ),
  ),
)
```

Read it from outside to inside:

- `Scaffold` gives the screen structure
- `Center` puts the content in the middle area
- `Padding` adds space around the content
- `Column` stacks items vertically
- `Row` groups small items horizontally

## Common Beginner Mistakes

### 1. Forgetting spacing

If widgets look stuck together, add `SizedBox` or `Padding`.

### 2. Mixing up axes

If `mainAxisAlignment` does not behave as expected, first ask:

- am I inside a `Row`?
- or inside a `Column`?

### 3. Using one huge widget tree without reading it in layers

Break the layout mentally into:

- outer structure
- main content direction
- inner groups
- spacing

## Practice for This Session

Today, build a simple profile card layout with:

- one `Column` for the page content
- one `Row` for profile statistics
- `Padding` around the full card
- `SizedBox` between title, subtitle, stats, and buttons

Use the guided exercise here:

- `01_beginner/03_layout_forms_navigation/exercises/session11/session11_layout_basics.md`

## Output Completed

- Prepared Session 11 study note for Week 3.
- Added a guided hands-on exercise for layout practice.

## Evidence

- Related project: `01_beginner/03_layout_forms_navigation/`
- Practice file: `01_beginner/03_layout_forms_navigation/exercises/session11/session11_layout_basics.md`

## Note About Tests

- Later on, write specific tests that match the program you are actually building.
- If the default generated test does not fit the current app yet, it is fine to temporarily leave `void main() {}` in the test file so builds do not fail for the wrong reason.
- The default counter test is not suitable once the sample app is no longer a counter app, so it should be replaced by real tests later instead of being kept blindly.

## What I Understood

- `Column` is for vertical layout.
- `Row` is for horizontal layout.
- `Padding` adds space around a widget.
- `SizedBox` creates fixed spacing or fixed size.
- `mainAxisAlignment` and `crossAxisAlignment` depend on the widget direction.

## What Is Still Unclear

- I still need more repetition with axis thinking.
- I should practice when to use `Padding` vs `SizedBox`.

## What I Need to Review Next Session

- `Expanded`
- `Flexible`
- layout constraints
