import 'package:uuid/uuid.dart';

const uuid = Uuid();

/// Expense categories used to group each expense.
enum Category { food, stay, experience, shopping }

/// Data model for one expense item.
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
}
