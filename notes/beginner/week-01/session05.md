Session: Session 5 - OOP + Async + Mini CLI

Goal:
- Learn class, object, constructor, and method basics.
- Practice a simple model with `Student`.
- Learn basic `Future`, `async`, and `await`.
- Build a small CLI-style student manager.

Output completed:
- Created the file `01_beginner/01_setup_dart_basics/exercises/mini_cli/student_manager.dart`.
- Built a `Student` class with `name`, `age`, and `score`.
- Added a constructor, `isPassed()`, and `displayInfo()`.
- Created multiple `Student` objects and stored them in `List<Student>`.
- Added helper functions to show all students, passed students, and failed students.
- Added `loadStudents()` to practice basic async flow with `Future.delayed`.

Evidence:
- Related project: `01_beginner/01_setup_dart_basics/exercises/mini_cli`
- Screenshot: not added yet

What I understood:
- A class is a blueprint, and an object is a concrete value created from that blueprint.
- A constructor defines how an object is created.
- A method is a function that belongs to a class and can use that object's fields.
- `List<Student>` is cleaner than using `List<Map<String, dynamic>>` when the data shape is known.
- `async` allows a function to use `await`.
- `await` pauses until a `Future` completes.

What is still unclear:
- I should keep practicing naming functions clearly, especially when a function works with multiple objects.
- I need more practice separating model code from CLI flow as programs get larger.

What I need to review next session:
- Flutter mindset.
- Widget tree basics.
- `MaterialApp`, `Scaffold`, and how Flutter builds UI from widgets.
