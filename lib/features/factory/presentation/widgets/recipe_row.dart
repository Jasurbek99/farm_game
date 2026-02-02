import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/features/factory/domain/models/recipe.dart';

class RecipeRow extends StatelessWidget {
  final Recipe recipe;

  const RecipeRow({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ingredient
        Container(
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
          child: Center(
            child: Image.asset(
              recipe.ingredientAsset,
              width: AppDimens.iconXl,
              height: AppDimens.iconXl,
            ),
          ),
        ),
        const SizedBox(width: AppDimens.paddingMd),
        // Plus sign
        Container(
          width: AppDimens.iconLg,
          height: AppDimens.iconLg,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            size: AppDimens.iconMd,
          ),
        ),
        const SizedBox(width: AppDimens.paddingMd),
        // Product
        Container(
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
          child: Center(
            child: Image.asset(
              recipe.productAsset,
              width: AppDimens.iconXl,
              height: AppDimens.iconXl,
            ),
          ),
        ),
      ],
    );
  }
}
