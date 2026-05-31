import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:week8workshop/expenses.dart';
import 'package:week8workshop/models/expenses_state.dart';

void main() {
  testWidgets('shows travel expenses screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ExpensesState(),
        child: const MaterialApp(home: Expenses()),
      ),
    );

    expect(find.text('Travel Expenses'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
