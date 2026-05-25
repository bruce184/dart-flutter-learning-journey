# Session 16 Exercise - TextField and Text Input

## Objective

Build a small text input screen and practice:

- `TextField`
- `TextEditingController`
- reading input with `.text`
- `dispose()`
- `setState()`
- `keyboardType`
- `textInputAction`
- `onSubmitted`
- `SingleChildScrollView` for form-like screens

## Suggested Output

Create one screen with:

- an app bar titled `Session 16 Text Input`
- a name input field
- an email input field
- one `Submit` button
- submitted name and email shown below the button
- keyboard behavior suited to each field

## Create Project

From the repository root, create the practice app with:

```powershell
cd "D:\1.UMT\1.SUBJECTS\3.JUNIOR\SEM9\MOBILE 3\flutter\01_beginner\03_layout_forms_navigation\exercises\session16"
flutter create session16_text_input_app
cd session16_text_input_app
```

Then build the exercise mainly in:

```text
lib/main.dart
```

## Key Ideas

Use `TextField` for simple input:

```dart
TextField(
  decoration: const InputDecoration(
    labelText: 'Name',
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
)
```

Use `TextEditingController` to read the input:

```dart
final TextEditingController nameController = TextEditingController();
```

Read text with:

```dart
nameController.text
```

Dispose controllers:

```dart
@override
void dispose() {
  nameController.dispose();
  super.dispose();
}
```

## Widget Tree Target

```text
Scaffold
  AppBar
  body
    Padding
      SingleChildScrollView
        Column
          TextField (name)
          SizedBox
          TextField (email)
          SizedBox
          ElevatedButton
          SizedBox
          Text (submitted name)
          SizedBox
          Text (submitted email)
```

## Build Steps

### Step 1 - App Shell

Create a `StatefulWidget` because submitted values will change on the screen.

### Step 2 - Add Controllers

Add two controllers:

```dart
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
```

Add submitted state:

```dart
String submittedName = '';
String submittedEmail = '';
```

### Step 3 - Dispose Controllers

```dart
@override
void dispose() {
  nameController.dispose();
  emailController.dispose();
  super.dispose();
}
```

### Step 4 - Submit Both Inputs

```dart
void _submitForm() {
  setState(() {
    submittedName = nameController.text;
    submittedEmail = emailController.text;
  });

  debugPrint('Name: $submittedName');
  debugPrint('Email: $submittedEmail');
}
```

### Step 5 - Build The Inputs

Name field:

```dart
TextField(
  controller: nameController,
  keyboardType: TextInputType.name,
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
    labelText: 'Name',
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
)
```

Email field:

```dart
TextField(
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.done,
  onSubmitted: (_) => _submitForm(),
  decoration: const InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email',
    border: OutlineInputBorder(),
  ),
)
```

### Step 6 - Add Submit Button

```dart
ElevatedButton(
  onPressed: _submitForm,
  child: const Text('Submit'),
)
```

### Step 7 - Show Submitted Values

```dart
Text(
  submittedName.isEmpty ? 'No name submitted yet' : 'Name: $submittedName',
)
```

```dart
Text(
  submittedEmail.isEmpty ? 'No email submitted yet' : 'Email: $submittedEmail',
)
```

## Important Notes

- `keyboardType` changes the keyboard type, but it does not validate input.
- `textInputAction` changes the keyboard action button.
- `onSubmitted` runs when the field is submitted from the keyboard.
- Validation will be handled in Session 17 with `TextFormField`.

## Check Yourself

- What does `TextEditingController` do?
- Why do controllers need `dispose()`?
- What does `.text` return?
- Why does submitted UI need `setState()`?
- What is the difference between `keyboardType` and `textInputAction`?
- Why is `SingleChildScrollView` useful on a form screen?

## Completion Criteria

You can mark Session 16 complete when:

- the app has name and email inputs
- pressing `Submit` shows both values on the UI
- pressing `Done` in the email field also submits
- controllers are disposed
- the screen does not overflow
- `flutter analyze` has no issues

