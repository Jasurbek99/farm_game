import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/features/store/domain/models/store_item.dart';

class StoreItemCard extends StatelessWidget {
  final StoreItem item;
  final VoidCallback onTap;

  const StoreItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.panelDark,
          border: Border.all(
            color: AppColors.panelBorder,
            width: AppDimens.cardBorderWidth,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(AppDimens.paddingSm),
                decoration: BoxDecoration(
                  color: AppColors.panelBackground,
                  borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                ),
                child: Center(
                  child: Image.asset(
                    item.asset,
                    width: AppDimens.iconLg,
                    height: AppDimens.iconLg,
                  ),
                ),
              ),
            ),
            Text(
              item.name.toUpperCase(),
              style: AppTextStyles.labelMedium,
            ),
            const SizedBox(height: AppDimens.paddingSm),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingSm,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonGreen,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimens.radiusMd),
                  bottomRight: Radius.circular(AppDimens.radiusMd),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.coinIcon,
                    width: AppDimens.iconSm,
                    height: AppDimens.iconSm,
                  ),
                  const SizedBox(width: AppDimens.paddingXs),
                  Text(
                    item.price.toString(),
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
