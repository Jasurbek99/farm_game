import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/farm/presentation/screens/farm_main_screen.dart';
import 'package:farm_game/features/farm/presentation/screens/chicken_barn_screen.dart';
import 'package:farm_game/features/factory/presentation/screens/factory_main_screen.dart';
import 'package:farm_game/features/factory/presentation/screens/cake_factory_screen.dart';
import 'package:farm_game/features/store/presentation/screens/store_screen.dart';
import 'package:farm_game/features/friends/presentation/screens/friends_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/profile_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/change_password_screen.dart';
import 'package:farm_game/features/profile/presentation/screens/language_screen.dart';

class DesignGalleryScreen extends StatelessWidget {
  const DesignGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      _ScreenItem('Farm Main', const FarmMainScreen()),
      _ScreenItem('Chicken Barn', const ChickenBarnScreen()),
      _ScreenItem('Factory Main', const FactoryMainScreen()),
      _ScreenItem('Cake Factory', const CakeFactoryScreen()),
      _ScreenItem('Store', const StoreScreen()),
      _ScreenItem('Friends', const FriendsScreen()),
      _ScreenItem('Profile', const ProfileScreen()),
      _ScreenItem('Change Password', const ChangePasswordScreen()),
      _ScreenItem('Language', const LanguageScreen()),
    ];

    return AppScaffold(
      backgroundColor: AppColors.profileBackground,
      showBottomNav: false,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingMd),
        child: Column(
          children: [
            const SizedBox(height: AppDimens.paddingLg),
            Text(
              'DESIGN GALLERY',
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.paddingLg),
            Expanded(
              child: ListView.separated(
                itemCount: screens.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppDimens.paddingMd,
                ),
                itemBuilder: (context, index) {
                  final screen = screens[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screen.widget),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.paddingMd),
                      decoration: BoxDecoration(
                        color: AppColors.panelBackground,
                        border: Border.all(
                          color: AppColors.panelBorder,
                          width: AppDimens.cardBorderWidth,
                        ),
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      ),
                      child: Text(
                        screen.name,
                        style: AppTextStyles.labelLarge,
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

class _ScreenItem {
  final String name;
  final Widget widget;

  _ScreenItem(this.name, this.widget);
}
