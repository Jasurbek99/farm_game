import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
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
          // Label with decorative name card
          SizedBox(
            width: AppDimens.buildingCardWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Decorative name card background
                SizedBox(
                  width: 70,
                  child: Image.asset(AppAssets.nameCard, fit: BoxFit.contain),
                ),
                // Label text on top
                Padding(
                  padding: const EdgeInsets.only(top: AppDimens.paddingSm),
                  child: Text(
                    label,
                    style: AppTextStyles.labelverySmall,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
