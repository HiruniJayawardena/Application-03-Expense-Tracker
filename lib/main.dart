import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

// "k" used as a convention for global variables
var kColorScheme  = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 36, 7, 37));


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor: Color.fromARGB(255, 244, 174, 247),
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        )
      ),
      home: const Expenses(),
    ),
  );
}

