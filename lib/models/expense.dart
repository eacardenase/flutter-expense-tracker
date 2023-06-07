import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
  study,
}

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
}
