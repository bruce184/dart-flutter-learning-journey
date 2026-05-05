# Session 12 Exercise - Expanded, Flexible, Constraints

## Objective

Build a small dashboard screen and practice:

- `Expanded`
- `Flexible`
- `flex`
- avoiding overflow in a `Row`
- reading layout as parent constraints plus child size

## Suggested Output

Create one screen with:

- an app bar titled `Session 12 Expanded Flexible`
- a profile row with an icon/avatar and long text
- a statistics row with 3 equal items
- a content row where one panel is twice as wide as the other
- one `Flexible` text example
- clean spacing using `Padding` and `SizedBox`

## Create Project

From the repository root, create the practice app with:

```bash
cd /Users/mickeynguyen/Development/Bruce/MOBILE3/flutter/01_beginner/03_layout_forms_navigation/exercises/session12
flutter create session12_expanded_flexible_app
cd session12_expanded_flexible_app
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
    Padding
      Column
        Row (profile)
          CircleAvatar or Icon
          SizedBox
          Expanded
            Column (name and subtitle)
        SizedBox
        Row (stats)
          Expanded (stat 1)
          SizedBox
          Expanded (stat 2)
          SizedBox
          Expanded (stat 3)
        SizedBox
        Row (panels)
          Expanded flex: 2
          SizedBox
          Expanded flex: 1
        SizedBox
        Row (Flexible text example)
```

## Build Steps

### Step 1

Start with a basic screen:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Session 12 Expanded Flexible'),
  ),
  body: const Padding(
    padding: EdgeInsets.all(16),
    child: Text('Start here'),
  ),
)
```

### Step 2

Replace `Text('Start here')` with a `Column`.

Use:

- `crossAxisAlignment: CrossAxisAlignment.stretch`
- `SizedBox(height: 16)` between sections

Goal:

- let each section use the available screen width
- keep spacing readable

### Step 3

Create a profile row.

Requirements:

- one avatar or icon on the left
- one long text area on the right
- wrap the text area with `Expanded`

Example:

```dart
Row(
  children: [
    CircleAvatar(
      child: Icon(Icons.person),
    ),
    SizedBox(width: 12),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bruce Nguyen'),
          Text('Learning Flutter layout constraints step by step'),
        ],
      ),
    ),
  ],
)
```

Try removing `Expanded` once and observe what happens with long text.

### Step 4

Create a stats row with 3 equal items.

Use:

```dart
Expanded(child: _StatCard(title: 'Lessons', value: '12'))
```

Put a `SizedBox(width: 12)` between each item.

Goal:

- each stat card gets equal width
- no fixed width is needed

### Step 5

Create a two-panel row.

Use:

- `Expanded(flex: 2, child: ...)`
- `Expanded(flex: 1, child: ...)`

Goal:

- left panel is wider
- right panel is narrower
- both adapt to available screen width

### Step 6

Add one `Flexible` example.

Suggested layout:

```dart
Row(
  children: [
    Icon(Icons.info_outline),
    SizedBox(width: 8),
    Flexible(
      child: Text(
        'Flexible lets this message use available space without forcing it to fill every pixel.',
      ),
    ),
  ],
)
```

Goal:

- understand that `Flexible` is less forceful than `Expanded`
- keep the row from overflowing

## Starter Snippet

Use this only if you get stuck. Try the steps above first.

```dart
body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bruce Nguyen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('Learning Flutter layout constraints step by step'),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Row(
        children: const [
          Expanded(child: _StatCard(title: 'Lessons', value: '12')),
          SizedBox(width: 12),
          Expanded(child: _StatCard(title: 'Practice', value: '8')),
          SizedBox(width: 12),
          Expanded(child: _StatCard(title: 'Focus', value: 'Layout')),
        ],
      ),
      const SizedBox(height: 16),
      Row(
        children: const [
          Expanded(
            flex: 2,
            child: _PanelCard(
              title: 'Main Area',
              color: Color(0xFFE3F2FD),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: _PanelCard(
              title: 'Side',
              color: Color(0xFFE8F5E9),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Row(
        children: const [
          Icon(Icons.info_outline),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              'Flexible lets this message use available space without forcing it to fill every pixel.',
            ),
          ),
        ],
      ),
    ],
  ),
)
```

Optional helper widgets:

```dart
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F6FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(title),
        ],
      ),
    );
  }
}

class _PanelCard extends StatelessWidget {
  const _PanelCard({
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title),
    );
  }
}
```

## Check Yourself

- What happens when you remove `Expanded` from the profile text?
- In a `Row`, does `Expanded` control width or height?
- If one child has `flex: 2` and another has `flex: 1`, how is space divided?
- When would `Flexible` be a better choice than `Expanded`?
