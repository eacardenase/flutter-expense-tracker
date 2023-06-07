import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
  learning,
}

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining_rounded,
  ExpenseCategory.travel: Icons.flight_takeoff_rounded,
  ExpenseCategory.leisure: Icons.movie_rounded,
  ExpenseCategory.work: Icons.work_rounded,
  ExpenseCategory.learning: Icons.menu_book_rounded,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }); // : id = uuid.v4(); // initializer list

  final String id = uuid.v4(); // not required if used the initalizer list
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
