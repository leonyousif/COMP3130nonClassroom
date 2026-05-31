import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8workshop/models/expense_model.dart';
import 'package:week8workshop/models/expenses_state.dart';

/// Card UI for one expense, including category icon and delete action.
class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  /// Asks for confirmation before removing an expense from Provider state.
  Future<void> _confirmDeleteExpense(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Expense?'),
        content: Text('Delete "${expense.name}" from your expenses?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext, false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext, true);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete != true || !context.mounted) {
      return;
    }

    Provider.of<ExpensesState>(context, listen: false).removeExpense(expense.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
                const Spacer(),
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8),
                Text(
                  expense.formattedDate,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {
                    _confirmDeleteExpense(context);
                  },
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Delete expense',
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              expense.category.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
