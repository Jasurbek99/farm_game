import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class BuildingCard extends StatelessWidget {
  final String buildingAsset;
  final String label;
  final VoidCallback onTap;

  const BuildingCard({
    super.key,
    required this.buildingAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Building image
          Image.asset(
            buildingAsset,
            width: AppDimens.buildingCardWidth,
            height: AppDimens.buildingCardHeight - AppDimens.iconLg,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: AppDimens.paddingSm),
          // Label
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMd,
              vertical: AppDimens.paddingSm,
            ),
            decoration: BoxDecoration(
              color: AppColors.panelBackground,
              border: Border.all(
                color: AppColors.panelBorder,
                width: AppDimens.cardBorderWidth,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radiusSm),
            ),
            child: Text(
              label,
              style: AppTextStyles.labelMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
