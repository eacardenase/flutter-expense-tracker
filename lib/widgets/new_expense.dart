import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_expense_tracker/models/expense.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onSaveExpense,
  });

  final void Function(Expense expense) onSaveExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.leisure;

  String get _formatedDate {
    return _selectedDate == null
        ? 'No Date Selected'
        : dateFormatter.format(_selectedDate!);
  }

  void _closeOverlay() {
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
      _selectedDate = pickedDate;
    });
  }

  void _selectExpenseCategory(ExpenseCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _submitExpenseData() {
    final enteredTitle = _titleController.text.trim();
    final enteredAmount = double.tryParse(
        _amountController.text); // returns null if unable to parse
    final amountIsValid = enteredAmount != null && enteredAmount >= 0;
    final dateIsValid = _selectedDate != null;
    final titleIsValid = enteredTitle.isNotEmpty;

    if (!titleIsValid || !amountIsValid || !dateIsValid) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text(
                'Invalid Input',
              ),
              content: const Text(
                'Please make sure a valid title, amount date and category was entered.',
              ),
              actions: [
                IconButton(
                  onPressed: _closeOverlay,
                  icon: const Icon(
                    Icons.close,
                  ),
                  color: Colors.red,
                )
              ],
            )),
      );

      return;
    }

    final newExpense = Expense(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    );

    widget.onSaveExpense(newExpense);

    _closeOverlay();
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
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
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
                      _formatedDate,
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
                onPressed: _closeOverlay,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text(
                  'Cancel',
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
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
