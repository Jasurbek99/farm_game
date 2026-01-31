import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class ResourceBar extends StatelessWidget {
  final String iconAsset;
  final int current;
  final int max;
  final Color barColor;
  final VoidCallback? onAddPressed;

  const ResourceBar({
    super.key,
    required this.iconAsset,
    required this.current,
    required this.max,
    this.barColor = AppColors.progressBar,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / max;

    return Container(
      height: AppDimens.resourceBarHeight,
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        border: Border.all(
          color: AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
      ),
      child: Row(
        children: [
          // Icon
          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingXs),
            child: Image.asset(
              iconAsset,
              width: AppDimens.iconSm,
              height: AppDimens.iconSm,
            ),
          ),
          // Progress bar
          Expanded(
            child: Stack(
              children: [
                // Background
                Container(
                  height: AppDimens.resourceBarHeight - AppDimens.paddingSm,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppDimens.radiusPill),
                  ),
                ),
                // Progress
                FractionallySizedBox(
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    height: AppDimens.resourceBarHeight - AppDimens.paddingSm,
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(AppDimens.radiusPill),
                    ),
                  ),
                ),
                // Text
                Center(
                  child: Text(
                    '$current/$max',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add button
          if (onAddPressed != null)
            GestureDetector(
              onTap: onAddPressed,
              child: Container(
                width: AppDimens.iconMd,
                height: AppDimens.iconMd,
                margin: const EdgeInsets.all(AppDimens.paddingXs),
                decoration: const BoxDecoration(
                  color: AppColors.buttonGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.textWhite,
                  size: AppDimens.iconSm,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
