import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography from the design system.
/// Font family: Inter
/// Source: Google Fonts
abstract final class AppTextStyles {
  static const String fontFamily = 'Inter';

  // H2 — 24px / 1.5rem / 600 SemiBold
  static final TextStyle h2 = GoogleFonts.inter(
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w600,
    color: AppColors.charcoal,
  );

  // H3 — 18px / 1.125rem / 600 SemiBold
  static final TextStyle h3 = GoogleFonts.inter(
    fontSize: 18,
    height: 1.125,
    fontWeight: FontWeight.w600,
    color: AppColors.charcoal,
  );

  // Body Large — 16px / 1rem / 400 Regular
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    height: 1,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyText,
  );

  // Body Medium — 14px / 0.875rem / 400 Regular
  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    height: 0.875,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyText,
  );

  // Body Small — 12px / 0.75rem / 400 Regular
  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    height: 0.75,
    fontWeight: FontWeight.w400,
    color: AppColors.mutedText,
  );

  // Button — 14px / 0.875rem / 600 SemiBold
  static final TextStyle button = GoogleFonts.inter(
    fontSize: 14,
    height: 0.875,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.02 * 14,
    color: AppColors.white,
  );

  // Caption / Label — 10px / 0.625rem / 500 Medium
  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 10,
    height: 0.625,
    fontWeight: FontWeight.w500,
    color: AppColors.mutedText,
  );

  // Useful variants
  static final TextStyle buttonSecondary = button.copyWith(
    color: AppColors.primaryOrange,
  );

  static final TextStyle disabledButton = button.copyWith(
    color: AppColors.disabledText,
  );

  static final TextStyle input = GoogleFonts.inter(
    fontSize: 14,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyText,
  );

  static final TextStyle inputHint = input.copyWith(
    color: AppColors.mutedText,
  );

  static final TextStyle badge = GoogleFonts.inter(
    fontSize: 12,
    height: 1,
    fontWeight: FontWeight.w600,
  );
}
