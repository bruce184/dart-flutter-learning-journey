void main() {
  // List
  print('=== List ===');
  List<String> subjects = ['Dart', 'Flutter', 'Firebase'];

  print(subjects.first);
  print(subjects.last);
  print(subjects.isEmpty);
  print(subjects.length);
  print(subjects[0]);

  subjects.add('SQL');
  print(subjects);

  //Map
  print('=== Map ===');
  Map<String, dynamic> student = {
    'name': 'Bruce',
    'age': 20,
    'isLearningFlutter': true,
  };

  print(student.keys);
  print(student.values);
  print(student['age']);
  print(student['name']);

  // Set
  print('=== Set ===');
  Set<String> tags = {'dart', 'flutter', 'dart'};
  // the 2nd dart isn't shown
  print(tags);

  tags.add('api');
  print(tags);

  // Named parameters
  print('=== Named parameters ===');
  showProfile(name: 'Bruce', age: 20);
  showProfile(name: 'Alex');

  // Null-aware operators
  print('=== Null-aware operators ===');
  // The '??' is used to check if the variable is null, if it is, it will use the value after the operator.
  String? name;
  print(name ?? 'Unknown');

  // The '?' is used to check if the variable is null.
  String? city;
  print(city?.length);

  // The '!' is used to assert that the variable is not null.
  String? country = "Vietnam";
  print(country!.length);

  // Test
  List<int> num = [1, 2, 3, 4, 5, 6];
  for (var i = 0; i < num.length; i++) {
    if (num[i] % 2 == 0) {
      print("${num[i]} is even");
    } else {
      print("${num[i]} is odd");
    }
  }

  Map<String, dynamic> user = {"name": "Luffy", "age": 19, "isCaptain": true};
  user.remove("age");
  print(user);

  Set<String> tags1 = {"flutter", "flutter", "firebase", "dart"};
  print(tags1);
  tags1.add("api");
  print(tags1);

  showProfile(name: "Henry");

  double? dbl = 10.5;
  print(dbl ?? "Unknown");

  String? nme = null;
  print(nme?.isEmpty);
}

void showProfile({required String name, int age = 18}) {
  print('Name: $name, Age: $age');
}
