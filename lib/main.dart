import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(
    255,
    5,
    99,
    125,
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (fn) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kDarkColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
            cardTheme: const CardTheme().copyWith(
              color: kDarkColorScheme.primaryContainer,
              shadowColor: kDarkColorScheme.onPrimaryContainer,
              margin: const EdgeInsets.all(
                12,
              ),
              elevation: 2.5,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer,
              ),
            ),
            textTheme: const TextTheme().copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.onPrimaryContainer,
                fontSize: 18,
              ),
            ),
          ),
          theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.primary,
              foregroundColor: kColorScheme.onSecondary,
            ),
            cardTheme: const CardTheme().copyWith(
              color: kColorScheme.primaryContainer,
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
              color: kColorScheme.primary,
            ),
          ),
          themeMode: ThemeMode.system, // set by default
          home: const Expenses(),
        ),
      );
    },
  );
}
