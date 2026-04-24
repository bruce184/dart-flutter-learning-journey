// Part 1: Class and Object
class Student {
  String name;
  int age;
  double score;

  // Constructor 
  Student({required this.name, required this.age, required this.score});

  // Part 3: Create a class method
  bool isPassed() {
    return score >= 5;
  }

  void displayInfo() {
    print("Name: $name, Age: $age, Score: $score");
  }
}

void showAllStudent(List<Student> students) {
  for (var student in students) {
    student.displayInfo();
  }
}

void showPassedStudent(List<Student> students) {
  for (var student in students) {
    if (student.isPassed()) {
      student.displayInfo();
    }
  }
}

void showFailedStudent(List<Student> students) {
  for (var student in students) {
    if (!student.isPassed()) {
      student.displayInfo();
    }
  }
}

// Part 5: Basic Async - IMPORTANT!!!
Future<void> loadStudents() async {
  print("Loading students...");
  await Future.delayed(Duration(seconds: 2));
  print("Students loaded.");
}

Future<void> main() async {
  await loadStudents();
  // Part 2: Create Objects
  Student std1 = Student(name: "Luffy", age: 20, score: 9.0);
  Student std2 = Student(name: "Nami", age: 19, score: 7.0);
  Student std3 = Student(name: "Zoro", age: 21, score: 4.5);

  print("Student 1 name is ${std1.name}");
  print("Student 2 age is ${std2.age}");
  print("Student 1 and 2 scores are ${std1.score} and ${std2.score}");
  print("--------------------------------");

  std1.displayInfo();
  std2.displayInfo();
  std3.displayInfo();
  print("--------------------------------");

  // Part 4: Create a list of students
  List<Student> students = [std1, std2, std3];
  for (var student in students) {
    student.displayInfo();
  }

  print("--------------------------------");
  print("showAllStudent");
  showAllStudent(students);

  print("--------------------------------");
  print("showPassedStudent");
  showPassedStudent(students);

  print("--------------------------------");
  print("showFailedStudent");
  showFailedStudent(students);
  print("--------------------------------");
}
