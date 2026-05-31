import 'package:flutter/material.dart';
import 'package:travelexpenses/models/expense_model.dart';

/// Displays a single expense inside a card.
class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(expense.name),
      ),
    );
  }
}
