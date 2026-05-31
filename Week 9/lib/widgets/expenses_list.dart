import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week9workshop/models/expenses_state.dart';
import 'package:week9workshop/widgets/expenses_item.dart';

/// Watches Provider state and renders all current expenses in a list.
class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    final allExpenses = context.watch<ExpensesState>().expenses;

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
