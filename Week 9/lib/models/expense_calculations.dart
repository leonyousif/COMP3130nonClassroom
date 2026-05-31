import 'package:week9workshop/models/expense_model.dart';

double sumExpenses(List<Expense> expenses) {
  return expenses.fold(0, (total, expense) => total + expense.amount);
}
