import 'package:flutter/material.dart';
import 'package:week6workshop/models/expense_model.dart';
import 'package:week6workshop/widgets/expenses_item.dart';

/// Displays the current list of expenses.
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.allExpenses});

  final List<Expense> allExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (context, index) {
        return ExpensesItem(
          expense: allExpenses[index],
        );
      },
    );
  }
}
