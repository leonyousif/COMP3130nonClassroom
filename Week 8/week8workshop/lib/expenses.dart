import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8workshop/models/expenses_state.dart';
import 'package:week8workshop/widgets/chart.dart';
import 'package:week8workshop/widgets/new_expense.dart';
import 'package:week8workshop/widgets/expenses_list.dart';

/// Main expenses screen that reads Provider state and opens the add form.
class Expenses extends StatelessWidget {
  const Expenses({super.key});

  /// Opens a nearly full-height bottom sheet for entering a new expense.
  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.95,
        child: const NewExpense(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Expenses'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<ExpensesState>(
        builder: (context, expensesState, child) => Column(
          children: [
            Chart(expenses: expensesState.expenses),
            const Expanded(
              child: ExpensesList(),
            ),
          ],
        ),
      ),
    );
  }
}
