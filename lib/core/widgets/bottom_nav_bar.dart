import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/features/navigation/nav_provider.dart';
import 'package:farm_game/features/navigation/nav_tab.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  void _switchTab(BuildContext context, NavProvider navProvider, NavTab tab) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    navProvider.setTab(tab);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, navProvider, child) {
        return Container(
          height: AppDimens.bottomNavHeight,
          decoration: const BoxDecoration(
            color: AppColors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                asset: AppAssets.navFarm,
                label: AppStrings.navFarm,
                isSelected: navProvider.currentTab == NavTab.farm,
                onTap: () => _switchTab(context, navProvider, NavTab.farm),
              ),
              _NavItem(
                asset: AppAssets.navFactory,
                label: AppStrings.navFactory,
                isSelected: navProvider.currentTab == NavTab.factory,
                onTap: () => _switchTab(context, navProvider, NavTab.factory),
              ),
              _NavItem(
                asset: AppAssets.navStore,
                label: AppStrings.navStore,
                isSelected: navProvider.currentTab == NavTab.store,
                onTap: () => _switchTab(context, navProvider, NavTab.store),
              ),
              _NavItem(
                asset: AppAssets.navFriends,
                label: AppStrings.navFriends,
                isSelected: navProvider.currentTab == NavTab.friends,
                onTap: () => _switchTab(context, navProvider, NavTab.friends),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final String asset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.asset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppDimens.bottomNavIconSize,
            height: AppDimens.bottomNavIconSize,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.panelBorder,
                width: AppDimens.cardBorderWidth,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
              color: isSelected ? AppColors.buttonYellow : AppColors.white,
            ),
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppDimens.paddingXs),
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
