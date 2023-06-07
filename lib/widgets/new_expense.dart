import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_expense_tracker/models/expense.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedDate = 'No Date Selected';
  ExpenseCategory _selectedCategory = ExpenseCategory.leisure;

  void _closeAddExpendeOverlay() {
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final todayDate = DateTime.now();
    final firstDate =
        DateTime(todayDate.year - 1, todayDate.month, todayDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: firstDate,
      lastDate: todayDate,
    );

    setState(() {
      _selectedDate = dateFormatter.format(pickedDate!);
    });
  }

  void _selectExpenseCategory(ExpenseCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  /*
  Called before the widget and it's state
  are about to being destroyed.
  */
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text(
                'Title',
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text(
                      'Amount',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                      ),
                    ),
                    Text(
                      _selectedDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownButton(
            isExpanded: true,
            value: _selectedCategory,
            items: ExpenseCategory.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              _selectExpenseCategory(value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              TextButton(
                onPressed: _closeAddExpendeOverlay,
                child: const Text(
                  'Cancel',
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  print(_selectedDate);
                  print(_selectedCategory);
                },
                child: const Text(
                  'Save Expense',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
