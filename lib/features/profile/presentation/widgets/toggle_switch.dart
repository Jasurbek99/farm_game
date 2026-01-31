import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMedium,
        ),
        const SizedBox(height: AppDimens.paddingSm),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: 100,
            height: AppDimens.buttonHeightSmall,
            decoration: BoxDecoration(
              color: value ? AppColors.buttonGreen : Colors.grey,
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
                          'ON',
                          style: AppTextStyles.buttonSmall,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'OFF',
                          style: AppTextStyles.buttonSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                // Toggle circle
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: value ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    width: 50,
                    height: AppDimens.buttonHeightSmall - AppDimens.paddingXs,
                    margin: const EdgeInsets.all(AppDimens.paddingXs),
                    decoration: const BoxDecoration(
                      color: AppColors.buttonYellow,
                      shape: BoxShape.circle,
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
