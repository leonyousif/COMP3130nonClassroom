import 'package:week10workshop/models/expense_model.dart';

/// Adds all expense amounts together for tests or summary displays.
double sumExpenses(List<Expense> expenses) {
  return expenses.fold(0, (total, expense) => total + expense.amount);
}
