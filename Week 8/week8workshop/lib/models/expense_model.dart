import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

/// Expense categories used by the model, chart, and dropdown.
enum Category { food, stay, experience, shopping }

/// Icons mapped to each expense category for display in the UI.
const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.experience: Icons.snowboarding,
  Category.shopping: Icons.shopping_basket,
  Category.stay: Icons.hotel,
};

/// Data model for one expense, including date formatting and generated id.
class Expense {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  /// Formats the stored date for display in cards and forms.
  String get formattedDate {
    return formatter.format(date);
  }
}
