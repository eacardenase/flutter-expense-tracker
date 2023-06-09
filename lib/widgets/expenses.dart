import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/chart/chart.dart';
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

  void _removeExpense(int index, Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text(
          'Expense deleted!',
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(index, expense);
            });
          },
        ),
      ),
    );
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
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text(
        'Not expenses found. Start adding some!',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: SafeArea(
        child: width < 600
            ? Column(
                children: [
                  Chart(
                    expenses: _registeredExpenses,
                  ),
                  Expanded(
                    child: mainContent,
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(
                      expenses: _registeredExpenses,
                    ),
                  ),
                  Expanded(
                    child: mainContent,
                  )
                ],
              ),
      ),
    );
  }
}
