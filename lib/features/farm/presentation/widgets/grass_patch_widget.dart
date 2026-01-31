import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_dimens.dart';

class GrassPatchWidget extends StatelessWidget {
  final String? itemAsset;

  const GrassPatchWidget({
    super.key,
    this.itemAsset,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.iconXl,
      height: AppDimens.iconXl,
      child: Stack(
        children: [
          // Grass background
          Image.asset(
            AppAssets.grass,
            fit: BoxFit.cover,
          ),
          // Item on grass
          if (itemAsset != null)
            Center(
              child: Image.asset(
                itemAsset!,
                width: AppDimens.iconLg,
                height: AppDimens.iconLg,
              ),
            ),
        ],
      ),
    );
  }
}
