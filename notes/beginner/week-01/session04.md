Session: Session 4 - Dart Basics 2

Goal:
- Learn `List`, `Map`, and `Set`.
- Practice named parameters.
- Use null-aware operators such as `?.`, `??`, and `!`.
- Build a small list-based exercise and review collection operations.

Output completed:
- Created the file `01_beginner/01_setup_dart_basics/exercises/basics_2/basic_2_practice.dart`.
- Practiced `List`, `Map`, and `Set` with add, remove, lookup, and duplicate handling.
- Used named parameters with a default value in `showProfile`.
- Practiced null-aware operators with nullable variables and simple fallback logic.
- Added extra practice for sorting a list, filtering scores, working with `List<Map<String, dynamic>>`, and using a boolean function with a ternary expression.

Evidence:
- Related project: `01_beginner/01_setup_dart_basics/exercises/basics_2`
- Screenshot: not added yet

What I understood:
- `List` keeps ordered items and is useful when index-based access matters.
- `Map` stores `key: value` pairs and is useful for labeled data.
- `Set` keeps only unique values and removes duplicates automatically.
- Named parameters make function calls clearer and are used heavily in Flutter.
- `??` provides a fallback value when the left side is `null`.
- `?.` safely accesses a property or method only when the value is not `null`.
- `!` asserts that a nullable value is not `null`, so it must be used carefully.
- The ternary operator `condition ? valueIfTrue : valueIfFalse` is a compact alternative to simple `if/else` value selection.

What is still unclear:
- I still need more practice choosing between `List`, `Map`, and `Set` in real scenarios.
- I should keep practicing when `!` is safe to use and when it may cause runtime errors.

What I need to review next session:
- Class, object, and constructor basics.
- Intro to `Future`, `async`, and `await`.
- Planning a very small CLI app for Session 5.
