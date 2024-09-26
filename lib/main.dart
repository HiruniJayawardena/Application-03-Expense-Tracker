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
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color : kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(   // there is no copywith
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          )
        ),
        textTheme: ThemeData() .textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
        )
      ),
      home: const Expenses(),
    ),
  );
}

