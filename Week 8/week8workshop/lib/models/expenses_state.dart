import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:week8workshop/models/expense_model.dart';

/// ChangeNotifier that owns the expense list and notifies widgets on changes.
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

  /// Exposes expenses as read-only data so widgets cannot mutate the list directly.
  UnmodifiableListView<Expense> get expenses => UnmodifiableListView(_expenses);

  /// Finds one expense by id, returning null when no match exists.
  Expense? getExpenseById(String id) {
    for (final expense in _expenses) {
      if (expense.id == id) {
        return expense;
      }
    }

    return null;
  }

  /// Adds an expense and tells listening widgets to rebuild.
  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  /// Removes an expense by id and tells listening widgets to rebuild.
  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }

  /// Replaces an existing expense with updated values.
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
