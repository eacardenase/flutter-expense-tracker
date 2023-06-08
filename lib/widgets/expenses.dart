import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_expense_tracker/widgets/new_expense.dart';

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
      title: 'Course Selling Online App Using Flutter for iOS and Android',
      amount: 39.900,
      date: DateTime.now(),
      category: ExpenseCategory.learning,
    ),
    Expense(
      title: 'Master Flutter By Building A Video And Voice Call Chat App',
      amount: 39.900,
      date: DateTime.now(),
      category: ExpenseCategory.learning,
    ),
    Expense(
      title: 'Master Flutter App Dev By Building A real Time Chat App',
      amount: 39.900,
      date: DateTime.now(),
      category: ExpenseCategory.learning,
    ),
    Expense(
      title: 'Flutter and Nodejs Course | Job App With Chatting',
      amount: 39.900,
      date: DateTime.now(),
      category: ExpenseCategory.learning,
    ),
    // Expense(
    //   title: 'Flutter Course for Complete Beginners',
    //   amount: 39.900,
    //   date: DateTime.now(),
    //   category: ExpenseCategory.learning,
    // ),
  ];

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _openAddExpenseOverlay() {
    // context is globally available
    // because we're inside of a state class
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => NewExpense(onSaveExpense: _addNewExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter - Expense Tracker',
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Text(
            'Chart...',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          )
        ],
      ),
    );
  }
}
