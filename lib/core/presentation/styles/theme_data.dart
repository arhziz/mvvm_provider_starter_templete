import 'package:flutter/material.dart';

class PracticeThemeData {
  static ThemeData getThemedata() => ThemeData(
        buttonTheme: const ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            padding: WidgetStatePropertyAll(
              EdgeInsets.only(
                top: 0,
                bottom: 0,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}
