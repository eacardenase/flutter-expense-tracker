import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }); // : id = uuid.v4(); // initializer list

  final String id = uuid.v4(); // not required if used the initalizer list
  final String title;
  final double amount;
  final DateTime date;
}
