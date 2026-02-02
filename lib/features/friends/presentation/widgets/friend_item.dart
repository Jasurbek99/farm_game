import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/primary_button.dart';
import 'package:farm_game/features/friends/domain/models/friend.dart';

class FriendItem extends StatelessWidget {
  final Friend friend;
  final VoidCallback onPresentTap;

  const FriendItem({
    super.key,
    required this.friend,
    required this.onPresentTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMd),
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
            width: AppDimens.iconLg,
            height: AppDimens.iconLg,
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
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textWhite,
              ),
            ),
          ),
          // Present button
          PrimaryButton(
            text: AppStrings.present,
            onPressed: onPresentTap,
            height: AppDimens.buttonHeightSmall,
            width: 100,
          ),
        ],
      ),
    );
  }
}
