import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, stay, experience, shopping }

const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.experience: Icons.snowboarding,
  Category.shopping: Icons.shopping_basket,
  Category.stay: Icons.hotel,
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
