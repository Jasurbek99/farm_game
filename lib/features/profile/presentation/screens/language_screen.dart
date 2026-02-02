import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      'English',
      'Spanish',
      'French',
      'German',
      'Chinese',
    ];

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
              AppStrings.language,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.paddingLg),
            // Language list
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppDimens.paddingMd,
                ),
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = index == 0;
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.paddingMd),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.buttonGreen
                            : AppColors.panelBackground,
                        border: Border.all(
                          color: AppColors.panelBorder,
                          width: AppDimens.cardBorderWidth,
                        ),
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      ),
                      child: Text(
                        language,
                        style: AppTextStyles.labelLarge.copyWith(
                          color: isSelected
                              ? AppColors.textWhite
                              : AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
