import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/core/widgets/primary_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.profileBackground,
      showBottomNav: false,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingMd),
        child: Column(
          children: [
            const SizedBox(height: AppDimens.paddingLg),
            // Title
            Text(
              AppStrings.changePassword,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.paddingXl),
            // Form fields
            _PasswordField(label: 'Old Password'),
            const SizedBox(height: AppDimens.paddingMd),
            _PasswordField(label: 'New Password'),
            const SizedBox(height: AppDimens.paddingMd),
            _PasswordField(label: 'Confirm Password'),
            const Spacer(),
            // Submit button
            PrimaryButton(
              text: 'SUBMIT',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: AppDimens.paddingLg),
          ],
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String label;

  const _PasswordField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMd,
        vertical: AppDimens.paddingMd,
      ),
      decoration: BoxDecoration(
        color: AppColors.panelBackground,
        border: Border.all(
          color: AppColors.panelBorder,
          width: AppDimens.cardBorderWidth,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary.withValues(alpha: 0.5),
          ),
          border: InputBorder.none,
        ),
        style: AppTextStyles.bodyMedium,
      ),
    );
  }
}
