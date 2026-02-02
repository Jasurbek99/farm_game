import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:farm_game/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:farm_game/features/profile/presentation/widgets/profile_button.dart';
import 'package:farm_game/features/profile/presentation/widgets/toggle_switch.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _musicOn = true;
  bool _soundOn = false;
  bool _vibrationOn = true;

  @override
  Widget build(BuildContext context) {
    final repository = ProfileRepositoryImpl(ProfileLocalDatasource());
    final profile = repository.getUserProfile();

    return AppScaffold(
      backgroundColor: AppColors.profileBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.paddingMd),
        child: Column(
          children: [
            const SizedBox(height: AppDimens.paddingXs),
            // Title
            Text(
              AppStrings.profile,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.paddingXs),
            // Avatar and user info
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppAssets.profileIconCard,
                      width: AppDimens.iconXl,
                      height: AppDimens.iconXl,
                      fit: BoxFit.contain,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      child: Image.asset(
                        profile.avatarAsset,
                        width: AppDimens.iconLg,
                        height: AppDimens.iconLg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppDimens.paddingMd),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.profileNameCard,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.paddingMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: AppDimens.paddingXs),
                            Text(
                              '${AppStrings.id} ${profile.userId}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.paddingMd),
            // Balance with decorative card
            Stack(
              alignment: Alignment.center,
              children: [
                // Decorative balance card background
                Image.asset(AppAssets.balanceCard, fit: BoxFit.contain),
                Positioned(
                  top: AppDimens.profileBalanceTitleTop,
                  child: Text(
                    AppStrings.balance,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                // Balance content
                Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingMd),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: AppDimens.profileBalanceContentTopPadding,
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppDimens.paddingXs),
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppDimens.paddingXl,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.panelDark,
                          borderRadius: BorderRadius.circular(
                            AppDimens.radiusPill,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.coinIcon,
                                  width: AppDimens.iconMd,
                                  height: AppDimens.iconMd,
                                ),
                                const SizedBox(width: AppDimens.paddingSm),
                                Text(
                                  profile.balance.toStringAsFixed(2),
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: AppDimens.iconMd,
                              height: AppDimens.iconMd,
                              decoration: const BoxDecoration(
                                color: AppColors.buttonGreen,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.textWhite,
                                size: AppDimens.iconSm,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.paddingXs),
            // Settings buttons with card background
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingLg,
                    vertical: AppDimens.paddingMd,
                  ),
                  child: Column(
                    children: [
                      ProfileButton(
                        label: AppStrings.changePassword,
                        iconAsset: AppAssets.passwordIcon,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/profile/change-password',
                          );
                        },
                      ),
                      const SizedBox(height: AppDimens.paddingMd),
                      ProfileButton(
                        label: AppStrings.language,
                        iconAsset: AppAssets.languageIcon,
                        onTap: () {
                          Navigator.pushNamed(context, '/profile/language');
                        },
                      ),
                      const SizedBox(height: AppDimens.paddingMd),
                      ProfileButton(
                        label: AppStrings.support,
                        iconAsset: AppAssets.supportIcon,
                        onTap: () {},
                      ),
                      const SizedBox(height: AppDimens.paddingMd),
                      ProfileButton(
                        label: AppStrings.privacyPolicy,
                        iconAsset: AppAssets.privacyIcon,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.paddingLg),
            // Toggle switches
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleSwitch(
                  label: AppStrings.music,
                  value: _musicOn,
                  onChanged: (value) {
                    setState(() {
                      _musicOn = value;
                    });
                  },
                ),
                ToggleSwitch(
                  label: AppStrings.sound,
                  value: _soundOn,
                  onChanged: (value) {
                    setState(() {
                      _soundOn = value;
                    });
                  },
                ),
                ToggleSwitch(
                  label: AppStrings.vibration,
                  value: _vibrationOn,
                  onChanged: (value) {
                    setState(() {
                      _vibrationOn = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: AppDimens.paddingLg),
            // User ID
            Text(
              '${AppStrings.yourId} ${profile.userId} ${AppStrings.pressToCopy}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.buttonOrange,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
