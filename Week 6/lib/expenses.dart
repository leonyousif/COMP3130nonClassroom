import 'package:flutter/material.dart';
import 'package:week6workshop/models/expense_model.dart';
import 'package:week6workshop/widgets/new_expense.dart';
import 'package:week6workshop/widgets/expenses_list.dart';

/// Main screen that manages the expense list and opens the add-expense form.
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  /// Starter expenses shown when the app first loads.
  final List<Expense> _registeredExpenses = [
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

  /// Opens the modal bottom sheet where the user can enter a new expense.
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  /// Adds a submitted expense to the list and rebuilds the screen.
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ExpensesList(
        allExpenses: _registeredExpenses,
      ),
    );
  }
}
