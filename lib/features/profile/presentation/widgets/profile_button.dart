import 'package:farm_game/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
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
      child: Stack(
        children: [
          Image.asset(
            AppAssets.profileItemsCard,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Positioned(
            top: AppDimens.paddingSm,
            left: AppDimens.paddingLg,
            child: Row(
              children: [
                if (iconAsset != null) ...[
                  Center(
                    child: Image.asset(
                      iconAsset!,
                      width: AppDimens.iconSm,
                      height: AppDimens.iconSm,
                    ),
                  ),
                  const SizedBox(width: AppDimens.paddingMd),
                ],
                Text(label, style: AppTextStyles.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
