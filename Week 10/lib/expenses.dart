import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week10workshop/models/expenses_state.dart';
import 'package:week10workshop/widgets/chart.dart';
import 'package:week10workshop/widgets/new_expense.dart';
import 'package:week10workshop/widgets/expenses_list.dart';

/// Main authenticated expenses screen with chart, list, and sign-out action.
class Expenses extends StatelessWidget {
  const Expenses({super.key});

  /// Opens a nearly full-height bottom sheet for entering a new expense.
  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) =>
          FractionallySizedBox(heightFactor: 0.95, child: const NewExpense()),
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
              // Signing out updates AuthGate, which then shows AuthScreen again.
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
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
            const Expanded(child: ExpensesList()),
          ],
        ),
      ),
    );
  }
}
