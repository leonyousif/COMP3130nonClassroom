import 'package:flutter/material.dart';
import 'package:wk5/expensesList.dart';
import 'package:wk5/models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _myExpenses = [
    Expense(
      name: "Brithday Dinner",
      amount: 300,
      date: DateTime.now(),
      category: Category.food),

    Expense(
      name: "Kayaking tour",
      amount: 70,
      date: DateTime.now(),
      category: Category.experience)
  ];
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Travel Expenses"),
            Text("Chart Placeholder"),
            Expanded(
              child: ExpensesList(allExpenses: _myExpenses),
              ),
          ],
        ),
      ),
    );
  }
}
