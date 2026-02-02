import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class ProfileButton extends StatelessWidget {
  final String label;
  final String? iconAsset;
  final VoidCallback onTap;

  const ProfileButton({
    super.key,
    required this.label,
    this.iconAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingMd),
        decoration: BoxDecoration(
          color: AppColors.panelBackground,
          border: Border.all(
            color: AppColors.panelBorder,
            width: AppDimens.cardBorderWidth,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
        child: Row(
          children: [
            if (iconAsset != null) ...[
              Container(
                width: AppDimens.iconMd,
                height: AppDimens.iconMd,
                decoration: BoxDecoration(
                  color: AppColors.panelBorder,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    iconAsset!,
                    width: AppDimens.iconSm,
                    height: AppDimens.iconSm,
                  ),
                ),
              ),
              const SizedBox(width: AppDimens.paddingMd),
            ],
            Text(
              label,
              style: AppTextStyles.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
