import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._(); // this basically makes it so you can't instantiate this class

  static String get _fontFamily => 'ClashDisplay-Regular';

  static ColorScheme get _lightScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryLight,
      brightness: Brightness.light,
    );
  }

  static ColorScheme get _darkScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.dark,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: _lightScheme,
      fontFamily: _fontFamily,
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: AppColors.brandPrimaryLight,
        childrenPadding: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.brandPrimary10.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.brandPrimary5,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.brandPrimary8,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.brandPrimary2,
            width: 2,
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.brandPrimary10.withOpacity(0.5),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            gapPadding: 8,
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.brandPrimary5,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 8,
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.brandPrimary8,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 8,
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.brandPrimary2,
              width: 2,
            ),
          ),
        ),
        menuStyle: MenuStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )
          ),
        ),
      )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: _darkScheme,
      fontFamily: _fontFamily,
      visualDensity: VisualDensity.comfortable,
      useMaterial3: true,
    );
  }
}
