import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:week10workshop/expenses.dart';
import 'package:week10workshop/models/expenses_state.dart';

void main() {
  testWidgets('shows the travel expenses start page', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ExpensesState(),
        child: const MaterialApp(
          home: Expenses(),
        ),
      ),
    );

    expect(find.text('Travel Expenses'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Birthday Dinner'), findsOneWidget);
    expect(find.text('Kayaking tour'), findsOneWidget);
  });
}
