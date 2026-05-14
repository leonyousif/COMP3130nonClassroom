import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:week9workshop/models/expense_model.dart';

class ExpensesState extends ChangeNotifier {
  final List<Expense> _expenses = [
    Expense(
      name: 'Birthday Dinner',
      amount: 300,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: 'Kayaking tour',
      amount: 70,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  Expense? getExpenseById(String id) {
    for (final expense in _expenses) {
      if (expense.id == id) {
        return expense;
      }
    }

    return null;
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  void updateExpense(Expense updatedExpense) {
    final expenseIndex = _expenses.indexWhere(
      (expense) => expense.id == updatedExpense.id,
    );

    if (expenseIndex == -1) {
      return;
    }

    _expenses[expenseIndex] = updatedExpense;
    notifyListeners();
  }
}
