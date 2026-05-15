import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:session13_listview_app/main.dart';

void main() {
  testWidgets('shows beginner session list', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Beginner Sessions'), findsOneWidget);
    expect(find.text('Session 1'), findsOneWidget);
    expect(find.text('Environment setup'), findsOneWidget);

    await tester.drag(find.byType(Scrollable), const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.text('Session 13'), findsOneWidget);
    expect(find.text('ListView'), findsOneWidget);
  });
}
