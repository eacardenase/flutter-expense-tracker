import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Udemy Course',
      amount: 9.99,
      date: DateTime.now(),
      category: ExpenseCategory.study,
    ),
    Expense(
      title: 'Cinema',
      amount: 9.99,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            'Chart...',
          ),
        ],
      ),
    );
  }
}
