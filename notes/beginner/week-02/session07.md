Session: Session 7 - StatelessWidget

Goal:
- Understand what a `StatelessWidget` is.
- Practice creating custom stateless widgets.
- Pass widget configuration through constructor parameters.
- Use `final` fields and `required` named parameters.
- Reduce repeated UI code by extracting reusable widgets.

Output completed:
- Updated `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`.
- Created a custom `SessionTitle` widget.
- Created a reusable `LearningText` widget.
- Passed text into widgets through constructors.
- Used `final String text` to store widget configuration.
- Used `required this.text` so each custom widget must receive text.
- Updated the screen content for Session 7.
- Ran `flutter analyze` successfully with no issues.

Evidence:
- Related project: `01_beginner/02_flutter_fundamentals/first_app`
- Main file: `01_beginner/02_flutter_fundamentals/first_app/lib/main.dart`
- Check result: `flutter analyze` reported `No issues found`.

What I understood:
- A `StatelessWidget` receives configuration through its constructor.
- A `StatelessWidget` should store configuration in `final` fields.
- `required this.text` means the caller must provide `text` when creating the widget.
- `build()` describes the UI that the widget wants to show.
- Extracting repeated `Text` widgets into `LearningText` makes the code cleaner and easier to reuse.
- If the text style needs to change later, it can be changed in one place.

What is still unclear:
- I should keep practicing when to extract a widget and when to keep UI inline.
- I need more practice understanding what causes widgets to rebuild.

What I need to review next session:
- `StatefulWidget`.
- `setState`.
- The difference between widget configuration and mutable state.
