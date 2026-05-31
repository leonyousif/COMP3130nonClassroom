import 'package:flutter/material.dart';
import 'package:travelexpenses/models/expense_model.dart';
import 'package:travelexpenses/widgets/expenses_list.dart';

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
      name: 'Birthday Dinner',
      amount: 300,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: 'Kayaking tour',
      amount: 70,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Travel Expenses'),
            const Text('Chart Placeholder'),
            Expanded(
              child: ExpensesList(allExpenses: _myExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
