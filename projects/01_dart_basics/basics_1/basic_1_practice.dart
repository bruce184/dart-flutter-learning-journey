void main() {
  print("=== Session 3 Dart Basic 1 practice ===");

  // If/Else statement
  double score = 7.5;

  if (score >= 8) {
    print("Excellent");
  } else if (score >= 6.5) {
    print("Passed");
  } else {
    print("Failed");
  }

  // For Loop
  for (int i = 1; i <= 5; i++) {
    print("Count: $i");
  }

  // While Loop
  int countdown = 5;
  while (countdown > 0) {
    print("countdown: $countdown");
    countdown--;
  } 

  // Function
  print(greet("Bruce"));

  var topic = "Dart";
  final today = "Session 3";
  const maxDays = 5;

  print("Topic: $topic");
  print("Today: $today");
  print("Max Days: $maxDays");

  topic = "Flutter";
  print("Topic after change: $topic");
  // today = "Session 4"; // error
  // maxDays = 6; // error

  // Null safety check
  String? nickname;
  print("Nickname: $nickname");
  nickname = "Bruce";
  print("Nickname after assign value: $nickname");

  print("Sum of 2 number: ${sumTwoNumbers(a:1, b:2)}");
  
  print("Is passed: ${isPassed(score)}");
}

String greet(String name) {
  return "Xin chao, $name!";
}

int sumTwoNumbers({required int a, required int b}) {
  return a + b;
}

bool isPassed(double score) {
  return score >= 5;
}
