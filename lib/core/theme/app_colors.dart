import 'package:flutter/material.dart';

/// Design system colors based on the provided UI specification.
abstract final class AppColors {
  // Primary — Orange
  static const Color primaryOrange = Color(0xFFFF9900);
  static const Color orangeLight = Color(0xFFFFB700);
  static const Color orangeDark = Color(0xFFE67E00);

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF7F8FA);
  static const Color lightGray = Color(0xFFECEEF2);
  static const Color charcoal = Color(0xFF1A1A2E);

  // Text / supporting colors
  static const Color bodyText = Color(0xFF45455F);
  static const Color mutedText = Color(0xFF7B7F90);
  static const Color border = Color(0xFFE2E5EA);

  // Button states
  static const Color disabledBackground = Color(0xFFECEEF2);
  static const Color disabledText = Color(0xFFB1B5C3);

  // Input states
  static const Color error = Color(0xFFFF3B3B);
  static const Color errorBackground = Color(0xFFFFF5F5);

  // Status badges
  static const Color success = Color(0xFF18B957);
  static const Color successBackground = Color(0xFFE5F8ED);

  static const Color lowStock = Color(0xFFFF9900);
  static const Color lowStockBackground = Color(0xFFFFF3DD);

  static const Color outOfStock = Color(0xFFFF3B3B);
  static const Color outOfStockBackground = Color(0xFFFFE8E8);

  static const Color newArrival = Color(0xFF5D2C91);
  static const Color newArrivalBackground = Color(0xFFEDE6F7);

  static const Color sale = Color(0xFFFF9900);
}
