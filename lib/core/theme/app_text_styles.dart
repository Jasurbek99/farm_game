import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w900,
    color: AppColors.textWhite,
    fontFamily: 'Digitalt',
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w900,
    color: AppColors.textWhite,
    fontFamily: 'Digitalt',
    shadows: [
      Shadow(offset: Offset(2.0, 2.0), blurRadius: 3.0, color: AppColors.black),
    ],
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    fontFamily: 'Digitalt',
  );

  // Button styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    color: AppColors.textWhite,
    fontFamily: 'Digitalt',
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: AppColors.textWhite,
    fontFamily: 'Digitalt',
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    fontFamily: 'Digitalt',
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Digitalt',
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: 'Digitalt',
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: 'Digitalt',
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    fontFamily: 'Digitalt',
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    fontFamily: 'Digitalt',
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    fontFamily: 'Digitalt',
  );
  static const TextStyle labelverySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary,
    fontFamily: 'Digitalt',
  );
}
