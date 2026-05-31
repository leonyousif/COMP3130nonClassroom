import 'package:flutter/material.dart';
import 'package:travelexpenses/models/expense_model.dart';
import 'package:travelexpenses/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> allExpenses;

  const ExpensesList({super.key, required this.allExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (ctx, index) => ExpensesItem(allExpenses[index]),
    );
  }
}
