import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class InventorySlot extends StatelessWidget {
  final String iconAsset;
  final int count;
  final VoidCallback? onAddPressed;

  const InventorySlot({
    super.key,
    required this.iconAsset,
    required this.count,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.inventorySlotSize,
      height: AppDimens.inventorySlotSize,
      decoration: BoxDecoration(
        color: AppColors.panelDark,
        border: Border.all(
          color: AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: Stack(
        children: [
          // Icon
          Center(
            child: Image.asset(
              iconAsset,
              width: AppDimens.iconXl,
              height: AppDimens.iconXl,
              fit: BoxFit.contain,
            ),
          ),
          // Add button
          if (onAddPressed != null)
            Positioned(
              bottom: AppDimens.paddingSm,
              left: AppDimens.paddingSm,
              child: GestureDetector(
                onTap: onAddPressed,
                child: Container(
                  width: AppDimens.iconMd,
                  height: AppDimens.iconMd,
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
            ),
          // Count
          Positioned(
            bottom: AppDimens.paddingSm,
            right: AppDimens.paddingSm,
            child: Text(
              count.toString(),
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
