import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class TitleBanner extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const TitleBanner({super.key, required this.title, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingLg,
        vertical: AppDimens.paddingMd,
      ),
      decoration: BoxDecoration(
        color: AppColors.panelBorder,
        border: Border.all(
          color: AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: Text(
        title,
        style: textStyle ?? AppTextStyles.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
