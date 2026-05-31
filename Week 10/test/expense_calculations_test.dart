import 'package:flutter_test/flutter_test.dart';
import 'package:week10workshop/models/expense_calculations.dart';
import 'package:week10workshop/models/expense_model.dart';

void main() {
  group('sumExpenses', () {
    test('returns 0 for an empty list', () {
      expect(sumExpenses([]), 0);
    });

    test('returns the amount for one expense', () {
      final expenses = [
        Expense(
          name: 'Lunch',
          amount: 18.50,
          date: DateTime(2026, 5, 15),
          category: Category.food,
        ),
      ];

      expect(sumExpenses(expenses), 18.50);
    });

    test('adds the amounts for many expenses', () {
      final expenses = [
        Expense(
          name: 'Hotel',
          amount: 220,
          date: DateTime(2026, 5, 15),
          category: Category.stay,
        ),
        Expense(
          name: 'Museum',
          amount: 35.75,
          date: DateTime(2026, 5, 16),
          category: Category.experience,
        ),
        Expense(
          name: 'Dinner',
          amount: 48.25,
          date: DateTime(2026, 5, 16),
          category: Category.food,
        ),
      ];

      expect(sumExpenses(expenses), 304);
    });
  });
}
