import 'package:flutter/material.dart';

class FlutterMyStonksTheme {
  static ThemeData get retailBankTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 117, 208, 247),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
      ),
    );
  }

  static ThemeData get neobankTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 16, 46, 59),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.greenAccent,
      ),
    );
  }
}
