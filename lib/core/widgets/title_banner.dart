import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class TitleBanner extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const TitleBanner({super.key, required this.title, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimens.paddingLg),
      padding: const EdgeInsets.only(top: AppDimens.paddingLg),
      width: AppDimens.inventorySlotSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.nameCard),
          fit: BoxFit.contain,
        ),
      ),
      child: Text(
        title,
        style: (textStyle ?? AppTextStyles.titleSmall).copyWith(height: 0.9),
        textAlign: TextAlign.center,
      ),
    );
  }
}
