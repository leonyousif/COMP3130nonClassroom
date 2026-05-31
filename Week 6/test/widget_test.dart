import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:week6workshop/expenses.dart';

void main() {
  testWidgets('shows travel expenses screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    expect(find.text('Travel Expenses'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
