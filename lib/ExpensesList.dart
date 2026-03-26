import 'package:flutter/material.dart';
import 'package:wk5/models/expense_model.dart';



class ExpensesList extends StatelessWidget {
  final List<Expense> allExpenses;

  const ExpensesList({super.key, required this.allExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (listContext, index) => Text(allExpenses[index].name),
    );
  }
}