import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8workshop/expenses.dart';
import 'package:week8workshop/models/expenses_state.dart';

/// Starts the Week 8 app and provides shared expense state to the widget tree.
void main() {
  const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB55233),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFE8B04A),
    onSecondary: Color(0xFF2D1A00),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFF9F4EF),
    onSurface: Color(0xFF251B16),
    primaryContainer: Color(0xFFFFD9CC),
    onPrimaryContainer: Color(0xFF3D1408),
    secondaryContainer: Color(0xFFFFE1A8),
    onSecondaryContainer: Color(0xFF251A00),
    tertiary: Color(0xFF586B2F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFDCEEAA),
    onTertiaryContainer: Color(0xFF161F00),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surfaceContainerHighest: Color(0xFFF0DED5),
    onSurfaceVariant: Color(0xFF56433B),
    outline: Color(0xFF88736B),
    outlineVariant: Color(0xFFDBC2B8),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF3B2F2A),
    onInverseSurface: Color(0xFFFFEDE6),
    inversePrimary: Color(0xFFFFB59E),
  );
  const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB59E),
    onPrimary: Color(0xFF5F1F0E),
    secondary: Color(0xFFFFCF70),
    onSecondary: Color(0xFF3B2A00),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    surface: Color(0xFF16110F),
    onSurface: Color(0xFFF1DFD8),
    primaryContainer: Color(0xFF7B3723),
    onPrimaryContainer: Color(0xFFFFD9CC),
    secondaryContainer: Color(0xFF584400),
    onSecondaryContainer: Color(0xFFFFE1A8),
    tertiary: Color(0xFFC0D28F),
    onTertiary: Color(0xFF2B340A),
    tertiaryContainer: Color(0xFF414B1F),
    onTertiaryContainer: Color(0xFFDCEEAA),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surfaceContainerHighest: Color(0xFF3A2D28),
    onSurfaceVariant: Color(0xFFD8C2B9),
    outline: Color(0xFFA38C83),
    outlineVariant: Color(0xFF56433B),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF1DFD8),
    onInverseSurface: Color(0xFF3B2F2A),
    inversePrimary: Color(0xFFB55233),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpensesState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.surface,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: lightColorScheme.tertiaryContainer,
            foregroundColor: lightColorScheme.onTertiaryContainer,
            centerTitle: true,
          ),
          cardTheme: CardThemeData().copyWith(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: lightColorScheme.primary,
              foregroundColor: lightColorScheme.onPrimary,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: lightColorScheme.onSurface,
                ),
                headlineSmall: TextStyle(
                  fontSize: 15,
                  color: lightColorScheme.onSurface,
                ),
              ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkColorScheme,
          scaffoldBackgroundColor: darkColorScheme.surface,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: darkColorScheme.primaryContainer,
            foregroundColor: darkColorScheme.onPrimaryContainer,
            centerTitle: true,
          ),
          cardTheme: CardThemeData().copyWith(
            color: const Color(0xFF2B221E),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkColorScheme.primary,
              foregroundColor: darkColorScheme.onPrimary,
            ),
          ),
          textTheme: ThemeData.dark().textTheme.copyWith(
                titleMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkColorScheme.onSurface,
                ),
                headlineSmall: TextStyle(
                  fontSize: 15,
                  color: darkColorScheme.onSurface,
                ),
              ),
        ),
        home: const Expenses(),
      ),
    ),
  );
}
