import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week10workshop/models/expenses_state.dart';
import 'package:week10workshop/widgets/expenses_item.dart';

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
