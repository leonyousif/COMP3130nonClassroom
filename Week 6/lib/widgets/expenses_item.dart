import 'package:flutter/material.dart';
import 'package:week6workshop/models/expense_model.dart';

/// Card UI for displaying the details of one expense.
class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                expense.name,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 4),
                Text(expense.formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
