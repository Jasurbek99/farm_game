import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';

class PanelCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;

  const PanelCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppDimens.paddingMd),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.panelBackground,
        border: Border.all(
          color: borderColor ?? AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: child,
    );
  }
}
