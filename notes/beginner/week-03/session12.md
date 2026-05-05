# Session 12 - Expanded, Flexible, Constraints

## Goal

- Understand why some layouts overflow when there is not enough space.
- Learn the basic idea of constraints in Flutter.
- Use `Expanded` to make a child take the remaining available space.
- Use `Flexible` when a child can take available space but does not have to fill all of it.
- Use `flex` to divide space between multiple children.
- Start recognizing when a `Row` or `Column` needs help distributing space.

## Before Starting Session 12

Review these ideas from Session 11:

- `Row` arranges children horizontally.
- `Column` arranges children vertically.
- `mainAxisAlignment` works along the main axis.
- `crossAxisAlignment` works along the cross axis.
- `SizedBox` is useful for fixed spacing.
- `Padding` is useful for space around a widget.

Session 12 continues from that foundation. The main question today is:

- what should happen when children need more space than the parent can give?

## 1. The Basic Idea of Constraints

Flutter layout is based on constraints.

A simple way to think about it:

- a parent gives size rules to its child
- the child chooses a size within those rules
- the parent places the child

Example:

```dart
Center(
  child: Container(
    width: 200,
    height: 100,
  ),
)
```

Meaning:

- `Center` gives its child room inside the screen.
- `Container` chooses to be `200` wide and `100` tall.
- `Center` places that container in the middle.

You do not need to master every detail yet. For now, remember:

- layout problems usually happen because a widget got too much space, too little space, or unbounded space.

## 2. Why a `Row` Can Overflow

A `Row` lays out children from left to right.

Example:

```dart
Row(
  children: [
    Icon(Icons.person),
    SizedBox(width: 12),
    Text('A very long user name that may not fit on the screen'),
  ],
)
```

If the text is too long, the `Row` may overflow.

Reason:

- the `Row` tries to give each child its natural size
- the text may ask for more width than the screen has
- Flutter shows an overflow warning

This is where `Expanded` and `Flexible` become useful.

## 3. `Expanded`

`Expanded` tells a child to take the remaining available space.

Example:

```dart
Row(
  children: [
    Icon(Icons.person),
    SizedBox(width: 12),
    Expanded(
      child: Text('Bruce Nguyen - Flutter Beginner'),
    ),
  ],
)
```

Meaning:

- the icon takes its normal width
- the gap takes `12` pixels
- the text gets the remaining width

This helps prevent horizontal overflow in many common `Row` layouts.

Use `Expanded` when:

- a child should fill the leftover space
- text should wrap or fit inside the available width
- multiple children should share available space

## 4. Multiple `Expanded` Widgets and `flex`

You can use more than one `Expanded` in the same `Row` or `Column`.

Example:

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(height: 80, color: Colors.blue),
    ),
    SizedBox(width: 12),
    Expanded(
      flex: 1,
      child: Container(height: 80, color: Colors.green),
    ),
  ],
)
```

Meaning:

- the first box gets 2 parts
- the second box gets 1 part
- total parts = 3

So the first box is about twice as wide as the second box.

Default `flex` is `1`.

That means this:

```dart
Expanded(child: Text('Posts'))
```

is the same as this:

```dart
Expanded(
  flex: 1,
  child: Text('Posts'),
)
```

If three `Expanded` widgets are placed next to each other and none of them writes `flex`, they share the available space equally.

## 5. `Flexible`

`Flexible` is similar to `Expanded`, but softer.

Example:

```dart
Row(
  children: [
    Flexible(
      child: Text('This text can use available space but does not have to fill everything.'),
    ),
  ],
)
```

Think of it like this:

- `Expanded`: you must fill the available space
- `Flexible`: you may use the available space

For beginner practice:

- use `Expanded` more often
- use `Flexible` when the child should be allowed to stay smaller

## 6. `Expanded` Inside `Column`

`Expanded` also works inside a `Column`.

Example:

```dart
Column(
  children: [
    Text('Header'),
    Expanded(
      child: Container(color: Colors.blue),
    ),
    Text('Footer'),
  ],
)
```

Meaning:

- header takes its natural height
- footer takes its natural height
- the blue container fills the remaining vertical space

This is useful for:

- screens with header, body, and footer
- layouts where one middle area should grow
- future list screens

## Common Beginner Mistakes

### 1. Putting `Expanded` in the wrong place

`Expanded` must be inside a `Row`, `Column`, or `Flex`.

Do not put it directly inside `Padding`, `Container`, or `Center`.

Correct:

```dart
Row(
  children: [
    Expanded(child: Text('Hello')),
  ],
)
```

Incorrect:

```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Expanded(child: Text('Hello')),
)
```

### 2. Using fixed widths too early

If a layout needs to adapt to screen size, try `Expanded` before hard-coding many widths.

### 3. Forgetting that `Expanded` depends on direction

Inside `Row`, `Expanded` shares horizontal space.

Inside `Column`, `Expanded` shares vertical space.

## Practice for This Session

Today, build a simple dashboard layout with:

- a profile row using `Expanded` for long text
- a stats row using multiple `Expanded` widgets
- one section where `flex: 2` and `flex: 1` create uneven space
- one example using `Flexible`
- no horizontal overflow

Use the guided exercise here:

- `01_beginner/03_layout_forms_navigation/exercises/session12/session12_expanded_flexible.md`

## Output Completed

- Prepared Session 12 study note for Week 3.
- Added a guided hands-on exercise for `Expanded`, `Flexible`, and constraints.

## Evidence

- Related project: `01_beginner/03_layout_forms_navigation/`
- Practice file: `01_beginner/03_layout_forms_navigation/exercises/session12/session12_expanded_flexible.md`

## What I Understood

- Parents give constraints to children.
- `Expanded` fills remaining space inside a `Row` or `Column`.
- `Flexible` lets a child use available space without forcing it to fill everything.
- `flex` divides available space by parts.
- If `flex` is not written, `Expanded` uses `flex: 1` by default.
- Fixed-size widgets and spacing take space first; `Expanded` divides what remains.
- `Expanded` follows the direction of the parent `Row` or `Column`.

## What Is Still Unclear

- I still need practice reading overflow errors.
- I should compare `Expanded` and fixed widths in real layouts.
- I should practice using `Expanded` inside both `Row` and `Column`.

## What I Need to Review Next Session

- `ListView`
- scrollable content
- why a large `Column` can overflow vertically
