# Session 16 - TextField and Text Input

## Goal

- Learn how to receive user input with `TextField`.
- Use `TextEditingController` to read text from input fields.
- Understand why controllers should be disposed.
- Use `setState()` to show submitted input on the UI.
- Add input-specific keyboard behavior with `keyboardType` and `textInputAction`.
- Prepare for `TextFormField` and validation in Session 17.

## Output Completed

- Created the practice app in `01_beginner/03_layout_forms_navigation/exercises/session16/session16_text_input_app`.
- Built a text input screen with name and email fields.
- Added `TextEditingController` for name and email.
- Disposed both controllers in `dispose()`.
- Used one `Submit` button to read both inputs.
- Used `setState()` to update submitted name and email on the UI.
- Used `TextInputType.name` for the name field.
- Used `TextInputType.emailAddress` for the email field.
- Used `TextInputAction.next` for the name field.
- Used `TextInputAction.done` for the email field.
- Added `onSubmitted` so pressing `Done` on the email keyboard submits the form.
- Wrapped the form content in `SingleChildScrollView` to avoid overflow on smaller screens.
- Ran `flutter analyze` successfully.

## Evidence

- Related project: `01_beginner/03_layout_forms_navigation/exercises/session16/session16_text_input_app`
- Main implementation file: `01_beginner/03_layout_forms_navigation/exercises/session16/session16_text_input_app/lib/main.dart`
- Practice file: `01_beginner/03_layout_forms_navigation/exercises/session16/session16_text_input.md`

## What I Understood

- `TextField` lets the user type text.
- `TextEditingController` lets the app read the current value of a `TextField`.
- The text value is read with `.text`, such as `nameController.text`.
- Controllers created in a `State` class should usually be disposed in `dispose()`.
- `dispose()` is for cleaning resources when the widget is removed, not for hot reload.
- `setState()` is needed when submitted values should appear on the UI.
- `keyboardType` changes the kind of keyboard shown to the user.
- `textInputAction` changes the action button on the keyboard, such as `next` or `done`.
- `onSubmitted` runs when the user submits the field from the keyboard.
- `SingleChildScrollView` is useful for form-like screens that may overflow on small screens.

## What Is Still Unclear

- I need more practice with focus control between fields.
- I should learn when `TextFormField` is better than `TextField`.
- I need validation rules for required fields and email format.

## What I Need To Review Next Session

- `Form`
- `TextFormField`
- `validator`
- `GlobalKey<FormState>`
- showing validation errors before submitting

