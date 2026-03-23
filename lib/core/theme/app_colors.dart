import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6C63FF);
  static const secondary = Color(0xFF00C9A7);
  static const accent = Color(0xFFFFA26B);

  static const backgroundLight = Color(0xFFF5F6FA);
  static const backgroundDark = Color(0xFF121212);

  static const cardLight = Colors.white;
  static const cardDark = Color(0xFF1E1E1E);

  static const textPrimaryLight = Colors.black;
  static const textPrimaryDark = Colors.white;

  static const textSecondaryLight = Colors.grey;
  static const textSecondaryDark = Colors.grey;

  static const borderLight = Color(0xFFE0E0E0);
  static const borderDark = Color(0xFF2C2C2C);

  static const success = Color(0xFF4CAF50);
  static const error = Color(0xFFF44336);
  static const warning = Color(0xFFFFC107);

  static Brightness _brightness(BuildContext context) =>
      Theme.of(context).brightness;

  static Color background(BuildContext context) =>
      _brightness(context) == Brightness.dark
          ? backgroundDark
          : backgroundLight;

  static Color card(BuildContext context) =>
      _brightness(context) == Brightness.dark
          ? cardDark
          : cardLight;

  static Color textPrimary(BuildContext context) =>
      _brightness(context) == Brightness.dark
          ? textPrimaryDark
          : textPrimaryLight;

  static Color textSecondary(BuildContext context) =>
      _brightness(context) == Brightness.dark
          ? textSecondaryDark
          : textSecondaryLight;

  static Color border(BuildContext context) =>
      _brightness(context) == Brightness.dark
          ? borderDark
          : borderLight;
}