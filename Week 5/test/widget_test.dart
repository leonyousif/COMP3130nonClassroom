import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travelexpenses/expenses.dart';

void main() {
  testWidgets('shows travel expenses screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    expect(find.text('Travel Expenses'), findsOneWidget);
    expect(find.text('Birthday Dinner'), findsOneWidget);
    expect(find.text('Kayaking tour'), findsOneWidget);
  });
}
