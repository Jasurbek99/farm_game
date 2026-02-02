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
import 'package:farm_game/features/friends/domain/models/friend.dart';
import 'package:farm_game/features/friends/presentation/widgets/friend_item.dart';
import 'package:farm_game/features/friends/presentation/widgets/suggested_friend_item.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  int _selectedTabIndex = 0;

  Widget _buildAddFriendsContent(List<Friend> suggestedFriends) {
    return Column(
      children: [
        // Find Friends button
        GestureDetector(
          onTap: () {
            // TODO: Implement find friends logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Finding friends...'),
              ),
            );
          },
          child: Container(
            height: AppDimens.buttonHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingLg,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonGreen,
              border: Border.all(
                color: AppColors.panelBorder,
                width: AppDimens.cardBorderWidth,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            ),
            child: Center(
              child: Text(
                AppStrings.findFriends,
                style: AppTextStyles.buttonLarge,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimens.paddingMd),
        // Suggested Friends section header
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.panelBorder,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingMd,
              ),
              child: Text(
                AppStrings.suggestedFriends,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.panelBorder,
                thickness: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.paddingMd),
        // Suggested friends list
        Expanded(
          child: ListView.separated(
            itemCount: suggestedFriends.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: AppDimens.paddingSm,
            ),
            itemBuilder: (context, index) {
              final friend = suggestedFriends[index];
              return SuggestedFriendItem(
                friend: friend,
                onVisitTap: () {
                  // TODO: Implement visit logic
                },
                onAddTap: () {
                  // TODO: Implement add friend logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Adding ${friend.name}...'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final datasource = FriendsLocalDatasource();
    final repository = FriendsRepositoryImpl(datasource);
    final friends = repository.getFriends();
    final suggestedFriends = datasource.getSuggestedFriends();

    return AppScaffold(
      backgroundColor: AppColors.friendsBackground,
      safeAreaTop: false,
      safeAreaLeft: false,
      safeAreaRight: false,
      body: Stack(
        children: [
          // Clouds
          Positioned(
            top: 20,
            left: 0,
            child: Image.asset(
              AppAssets.cloudLeft,
              fit: BoxFit.none,
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: Image.asset(
              AppAssets.cloudRight,
              fit: BoxFit.none,
              alignment: Alignment.topRight,
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
                        // Content based on selected tab
                        Expanded(
                          child: _selectedTabIndex == 0
                              ? ListView.separated(
                                  itemCount: friends.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: AppDimens.paddingMd,
                                  ),
                                  itemBuilder: (context, index) {
                                    final friend = friends[index];
                                    return FriendItem(
                                      friend: friend,
                                      onPresentTap: () {},
                                    );
                                  },
                                )
                              : _buildAddFriendsContent(suggestedFriends),
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
      child: SizedBox(
        height: AppDimens.buttonHeightSmall,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Button background image
            Image.asset(
              isSelected ? AppAssets.selectedTabButton : AppAssets.tabButton,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            // Button text
            Text(
              label,
              style: AppTextStyles.buttonMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
