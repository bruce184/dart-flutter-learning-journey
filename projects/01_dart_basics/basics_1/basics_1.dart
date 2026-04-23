void main() {
  // Title
  print('=== Buoi 3: Dart basics 1 ===');
  print("=== Session 3: Dart Basic 1 ===");

  // Basic Variables and Types
  var studentName = 'Nguyen Huy Hoang';
  int completedSessions = 2;
  double quizScore = 8.5;
  bool isLearningFlutter = true;

  print("=== Student 1 ===");
  print('Ten: $studentName');
  print('Da hoc xong $completedSessions buoi');
  print('Diem quiz: $quizScore');
  print('Dang hoc Flutter: $isLearningFlutter');

  var studentName1 = "Nguyen Huy Hoang";
  int completedSessions1 = 3;
  double quizScore1 = 10;
  bool isLearningFlutter1 = true;

  print("== Student 2 ===");
  print("Name: $studentName1");
  print("Completed sessions: $completedSessions1");
  print("Quiz Score: $quizScore1");
  print("Is Learning Flutter: $isLearningFlutter1");

  // Null safety: nullable variable can hold null
  String? nickname1 = "Bruce";
  print('Nickname 1: $nickname1');

  nickname1 = null;
  print("Nickname 1 after assign null: $nickname1");

  // var, final, const
  var currentTopic = 'Dart basics 1';
  final todayGoal = 'Hieu bien, kieu du lieu, va control flow';
  const maxStudyDaysPerWeek = 5;

  print('Topic: $currentTopic');
  print('Goal: $todayGoal');
  print('So ngay hoc toi da / tuan: $maxStudyDaysPerWeek');

  currentTopic = 'Dart syntax practice';
  print('Topic moi sau khi doi: $currentTopic');

  // if / else
  if (quizScore >= 8) {
    print('Ket qua: Ban dang nam bai kha tot.');
  } else {
    print('Ket qua: Ban can on lai them.');
  }

  // for loop
  print('Dem bang for:');
  for (int i = 1; i <= 3; i++) {
    print('Buoc $i');
  }

  // while loop
  print('Dem bang while:');
  int count = 1;
  while (count <= 3) {
    print('Lan $count');
    count++;
  }

  // Basic functions
  print(greet(studentName));
  print('Tong tu 1 den 5 = ${sumFromOneTo(5)}');
  print(
    'Trang thai hoc tap: ${buildStudyStatus(completedSessions, isLearningFlutter)}',
  );
}

String greet(String name) {
  return 'Xin chao, $name!';
}

int sumFromOneTo(int n) {
  int total = 0;

  for (int i = 1; i <= n; i++) {
    total += i;
  }

  return total;
}

String buildStudyStatus(int completedSessions, bool isLearningFlutter) {
  if (isLearningFlutter && completedSessions >= 2) {
    return 'Ban dang di dung lo trinh.';
  }

  return 'Ban can quay lai va on them.';
}
