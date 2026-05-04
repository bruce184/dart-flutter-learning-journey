# Session 11 Exercise - Layout Basics

## Objective

Build a small profile card screen and practice:

- `Column`
- `Row`
- `Padding`
- `SizedBox`

## Suggested Output

Create one screen with:

- an app bar titled `Session 11 Layout Basics`
- a centered card-like area
- profile name and subtitle stacked vertically
- a statistics row with 3 items
- two action buttons with spacing

## Widget Tree Target

```text
Scaffold
  AppBar
  body
    Center
      Padding
        Column
          Container (profile card)
            Padding
              Column
                CircleAvatar or Icon
                SizedBox
                Text (name)
                SizedBox
                Text (subtitle)
                SizedBox
                Row (stats)
                SizedBox
                Row (buttons)
```

## Build Steps

### Step 1

Start with a basic screen:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Session 11 Layout Basics'),
  ),
  body: const Center(
    child: Text('Start here'),
  ),
)
```

### Step 2

Replace the `Text('Start here')` with:

- `Padding`
- a `Column`
- `mainAxisAlignment: MainAxisAlignment.center`

Goal:

- center the main content area
- keep the content away from screen edges

### Step 3

Inside the `Column`, add:

- one avatar area
- one name
- one subtitle

Use `SizedBox(height: 12)` between items.

Example structure:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    CircleAvatar(
      radius: 36,
      child: Icon(Icons.person),
    ),
    SizedBox(height: 12),
    Text('Bruce Nguyen'),
    SizedBox(height: 8),
    Text('Flutter Beginner'),
  ],
)
```

### Step 4

Add a stats section using `Row`.

Suggested items:

- `Posts`
- `Followers`
- `Following`

Challenge:

- keep the items spaced evenly
- add a small `Column` inside each stat item

Hint:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Column(
      children: [
        Text('12'),
        SizedBox(height: 4),
        Text('Posts'),
      ],
    ),
  ],
)
```

### Step 5

Add action buttons in another `Row`.

Suggested buttons:

- `Follow`
- `Message`

Put a `SizedBox(width: 12)` between them.

### Step 6

Wrap the full content in a `Container` and then in `Padding` so it feels like a card.

You can experiment with:

- `color`
- `borderRadius`
- `boxShadow`

## Starter Snippet

Use this only if you get stuck. Try the steps above first.

```dart
body: Center(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 36,
            child: Icon(Icons.person, size: 36),
          ),
          const SizedBox(height: 12),
          const Text(
            'Bruce Nguyen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Flutter Beginner'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatItem(value: '12', label: 'Posts'),
              _StatItem(value: '340', label: 'Followers'),
              _StatItem(value: '180', label: 'Following'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Follow'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Message'),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
)
```

Optional helper widget:

```dart
class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
```

## Self-Check

- Did I use `Column` for vertical groups?
- Did I use `Row` for horizontal groups?
- Did I add `Padding` around the main content?
- Did I use `SizedBox` instead of random empty widgets?
- Do I understand why `mainAxisAlignment` works differently in `Row` and `Column`?

## Next Step After This Exercise

After this session feels comfortable, continue to:

- `Expanded`
- `Flexible`
- constraints
