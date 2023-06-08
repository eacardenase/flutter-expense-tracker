import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  // seedColor: const Color.fromARGB(
  //   255,
  //   96,
  //   59,
  //   181,
  // ),
  seedColor: const Color.fromRGBO(255, 118, 117, 1.0),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
