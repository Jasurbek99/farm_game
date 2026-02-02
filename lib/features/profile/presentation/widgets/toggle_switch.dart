import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';

class ToggleSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double trackHeight = AppDimens.buttonHeightSmall;
    final double knobPadding = AppDimens.paddingXs;
    final double knobDiameter = trackHeight - (knobPadding * 2);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppTextStyles.labelMedium),
        const SizedBox(height: AppDimens.paddingSm),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: AppDimens.toggleSwitchWidth,
            height: trackHeight,
            decoration: BoxDecoration(
              color: value ? AppColors.buttonGreen : AppColors.toggleTrackOff,
              borderRadius: BorderRadius.circular(AppDimens.radiusPill),
            ),
            child: Stack(
              children: [
                // Background labels
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          AppStrings.on,
                          style: AppTextStyles.buttonSmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppStrings.off,
                          style: AppTextStyles.buttonSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                // Toggle circle
                Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingXs),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment: value
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: SizedBox(
                      width: knobDiameter,
                      height: knobDiameter,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.buttonYellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
