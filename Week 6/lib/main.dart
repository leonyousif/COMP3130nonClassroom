import 'package:flutter/material.dart';
import 'package:week6workshop/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFCF7FD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B79D6),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFCF7FD),
          foregroundColor: Colors.black87,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFFF7F1FA),
          elevation: 1,
        ),
      ),
      home: Expenses(),
    ),
  );
}
