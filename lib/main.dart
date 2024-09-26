import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';

// "k" used as a convention for global variables
var kColorScheme  = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

//for dark theme
// var kDarkColorSchme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 7, 37));
var kDarkColorSchme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // this make sure that locking the orientation
  // Locking the system orientation. This adds before the run method
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn){
  runApp(
    MaterialApp(
      // dark theme consists dark parameters, so we don't need to add them manually
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSchme,
        cardTheme: const CardTheme().copyWith(
          color : kDarkColorSchme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(   // there is no copywith
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSchme.primaryContainer,
            foregroundColor: kDarkColorSchme.onPrimaryContainer,
          )
        ),
      ),
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
      themeMode: ThemeMode.system, // this is the default theme mode
      home: const Expenses(),
    ),
  );
  });
  
}

