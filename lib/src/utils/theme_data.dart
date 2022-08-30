import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  dividerColor: Colors.black12,
  iconTheme: const IconThemeData(color: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.black),
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.white,
  ),
  primaryColor: Colors.white,
  brightness: Brightness.light,
  textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black)),
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  dividerColor: Colors.grey,
  iconTheme: const IconThemeData(color: Colors.black),
  primaryIconTheme: const IconThemeData(color: Colors.black),
);

final deepTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 1, 18, 43),
  appBarTheme: AppBarTheme(color: Colors.blueGrey),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Color.fromARGB(255, 3, 59, 105),
    accentColor: Color.fromARGB(255, 3, 59, 105),
  ).copyWith(
    secondary: Color.fromARGB(255, 2, 77, 189),
  ),
  primaryColor: Color.fromARGB(255, 2, 38, 155),
  textTheme: const TextTheme(
      subtitle1: TextStyle(color: Color.fromARGB(255, 12, 239, 247))),
  backgroundColor: Color.fromARGB(255, 1, 41, 151),
  accentColor: Color.fromARGB(255, 32, 1, 170),
  dividerColor: Colors.grey,
  iconTheme: const IconThemeData(color: Colors.black),
  primaryIconTheme: const IconThemeData(color: Colors.black),
);
