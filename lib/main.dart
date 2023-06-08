import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(
    255,
    96,
    59,
    181,
  ),
  // seedColor: const Color.fromRGBO(255, 118, 117, 1.0),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onSecondary,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.tertiaryContainer,
            margin: const EdgeInsets.all(
              12,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: const TextTheme().copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 18,
            ),
          ),
          iconTheme: IconThemeData(
            color: kColorScheme.secondary,
          )),
      home: const Expenses(),
    ),
  );
}
