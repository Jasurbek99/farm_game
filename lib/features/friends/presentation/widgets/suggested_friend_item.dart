import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/features/friends/domain/models/friend.dart';

class SuggestedFriendItem extends StatelessWidget {
  final Friend friend;
  final VoidCallback onVisitTap;
  final VoidCallback onAddTap;

  const SuggestedFriendItem({
    super.key,
    required this.friend,
    required this.onVisitTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMd,
        vertical: AppDimens.paddingSm,
      ),
      decoration: BoxDecoration(
        color: AppColors.buttonYellow,
        border: Border.all(
          color: AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.panelBorder,
                width: AppDimens.cardBorderWidth,
              ),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                friend.avatarAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: AppDimens.paddingMd),
          // Name
          Expanded(
            child: Text(
              friend.name,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
          const SizedBox(width: AppDimens.paddingSm),
          // Visit button
          _ActionButton(
            label: AppStrings.visit,
            backgroundColor: AppColors.buttonRed,
            onTap: onVisitTap,
          ),
          const SizedBox(width: AppDimens.paddingSm),
          // Add button
          _ActionButton(
            label: AppStrings.add,
            backgroundColor: AppColors.buttonGreen,
            onTap: onAddTap,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMd,
          vertical: AppDimens.paddingSm,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: AppColors.panelBorder,
            width: AppDimens.cardBorderWidth,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonSmall,
        ),
      ),
    );
  }
}
