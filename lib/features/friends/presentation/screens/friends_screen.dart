import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/core/widgets/panel_card.dart';
import 'package:farm_game/features/friends/data/datasources/friends_local_datasource.dart';
import 'package:farm_game/features/friends/data/repositories/friends_repository_impl.dart';
import 'package:farm_game/features/friends/presentation/widgets/friend_item.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final repository = FriendsRepositoryImpl(FriendsLocalDatasource());
    final friends = repository.getFriends();

    return AppScaffold(
      backgroundColor: AppColors.friendsBackground,
      body: Stack(
        children: [
          // Clouds
          Positioned(
            top: AppDimens.paddingLg,
            left: AppDimens.paddingLg,
            child: Image.asset(
              AppAssets.cloud1,
              width: AppDimens.iconXl * 2,
            ),
          ),
          Positioned(
            top: AppDimens.paddingXl,
            right: AppDimens.paddingLg,
            child: Image.asset(
              AppAssets.cloud2,
              width: AppDimens.iconXl * 2,
            ),
          ),
          // Content
          Column(
            children: [
              const SizedBox(height: AppDimens.paddingLg),
              // Title
              Text(
                AppStrings.friends,
                style: AppTextStyles.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimens.paddingMd),
              // Content panel
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingMd),
                  child: PanelCard(
                    child: Column(
                      children: [
                        // Tabs
                        Row(
                          children: [
                            Expanded(
                              child: _TabButton(
                                label: AppStrings.friendsList,
                                isSelected: _selectedTabIndex == 0,
                                onTap: () {
                                  setState(() {
                                    _selectedTabIndex = 0;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: AppDimens.paddingMd),
                            Expanded(
                              child: _TabButton(
                                label: AppStrings.addFriends,
                                isSelected: _selectedTabIndex == 1,
                                backgroundColor: AppColors.buttonBrown,
                                onTap: () {
                                  setState(() {
                                    _selectedTabIndex = 1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimens.paddingMd),
                        // Friends list
                        Expanded(
                          child: ListView.separated(
                            itemCount: friends.length,
                            separatorBuilder: (context, index) => const SizedBox(
                              height: AppDimens.paddingMd,
                            ),
                            itemBuilder: (context, index) {
                              final friend = friends[index];
                              return FriendItem(
                                friend: friend,
                                onPresentTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.buttonHeightSmall,
        decoration: BoxDecoration(
          color: isSelected
              ? (backgroundColor ?? AppColors.buttonYellow)
              : AppColors.buttonBrown,
          border: Border.all(
            color: AppColors.panelBorder,
            width: AppDimens.cardBorderWidth,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.buttonMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
