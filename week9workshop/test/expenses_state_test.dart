import 'package:flutter_test/flutter_test.dart';
import 'package:week9workshop/models/expense_model.dart';
import 'package:week9workshop/models/expenses_state.dart';

void main() {
  group('ExpensesState', () {
    test('starts with the sample expenses', () {
      final state = ExpensesState();

      expect(state.expenses, hasLength(2));
      expect(state.expenses.first.name, 'Birthday Dinner');
      expect(state.expenses.last.name, 'Kayaking tour');
    });

    test('adds an expense and notifies listeners', () {
      final state = ExpensesState();
      var listenerCallCount = 0;
      final expense = Expense(
        name: 'Airport train',
        amount: 21.50,
        date: DateTime(2026, 5, 15),
        category: Category.experience,
      );

      state.addListener(() {
        listenerCallCount++;
      });

      state.addExpense(expense);

      expect(state.expenses, contains(expense));
      expect(state.getExpenseById(expense.id), expense);
      expect(listenerCallCount, 1);
    });

    test('removes an expense and notifies listeners', () {
      final state = ExpensesState();
      var listenerCallCount = 0;
      final expense = Expense(
        name: 'Souvenir',
        amount: 12,
        date: DateTime(2026, 5, 15),
        category: Category.shopping,
      );

      state.addExpense(expense);
      state.addListener(() {
        listenerCallCount++;
      });

      state.removeExpense(expense.id);

      expect(state.expenses, isNot(contains(expense)));
      expect(state.getExpenseById(expense.id), isNull);
      expect(listenerCallCount, 1);
    });
  });
}
