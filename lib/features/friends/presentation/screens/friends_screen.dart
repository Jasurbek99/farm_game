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

enum _FriendsTab { friendsList, addFriends }

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  late final FriendsRepositoryImpl _repository;
  late final List<Friend> _friends;
  late final List<Friend> _suggestedFriends;

  _FriendsTab _selectedTab = _FriendsTab.friendsList;

  @override
  void initState() {
    super.initState();
    _repository = FriendsRepositoryImpl(FriendsLocalDatasource());
    _friends = _repository.getFriends();
    _suggestedFriends = _repository.getSuggestedFriends();
  }

  void _selectTab(_FriendsTab tab) {
    if (_selectedTab == tab) return;
    setState(() {
      _selectedTab = tab;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildAddFriendsTab() {
    return Column(
      children: [
        // Find Friends button
        GestureDetector(
          onTap: () {
            // TODO: Implement find friends logic
            _showSnackBar(AppStrings.findingFriends);
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
                thickness: AppDimens.dividerThickness,
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
                thickness: AppDimens.dividerThickness,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.paddingMd),
        // Suggested friends list
        Expanded(
          child: ListView.separated(
            itemCount: _suggestedFriends.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppDimens.paddingSm),
            itemBuilder: (context, index) {
              final friend = _suggestedFriends[index];
              return SuggestedFriendItem(
                friend: friend,
                onVisitTap: () {
                  // TODO: Implement visit logic
                },
                onAddTap: () {
                  // TODO: Implement add friend logic
                  _showSnackBar('${AppStrings.addingFriend} ${friend.name}');
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFriendsListTab() {
    return ListView.separated(
      itemCount: _friends.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimens.paddingMd),
      itemBuilder: (context, index) {
        final friend = _friends[index];
        return FriendItem(friend: friend, onPresentTap: () {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.friendsBackground,
      safeAreaTop: false,
      safeAreaLeft: false,
      safeAreaRight: false,
      body: Stack(
        children: [
          // Clouds
          Positioned(
            top: AppDimens.cloudTopLeftTop,
            left: AppDimens.cloudTopLeftLeft,
            child: Image.asset(
              AppAssets.cloudLeft,
              fit: BoxFit.none,
              alignment: Alignment.topLeft,
            ),
          ),
          Positioned(
            top: AppDimens.cloudTopRightTop,
            right: AppDimens.cloudTopRightRight,
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
                                isSelected:
                                    _selectedTab == _FriendsTab.friendsList,
                                onTap: () =>
                                    _selectTab(_FriendsTab.friendsList),
                              ),
                            ),
                            const SizedBox(width: AppDimens.paddingMd),
                            Expanded(
                              child: _TabButton(
                                label: AppStrings.addFriends,
                                isSelected:
                                    _selectedTab == _FriendsTab.addFriends,
                                onTap: () => _selectTab(_FriendsTab.addFriends),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimens.paddingMd),
                        // Content based on selected tab
                        Expanded(
                          child: _selectedTab == _FriendsTab.friendsList
                              ? _buildFriendsListTab()
                              : _buildAddFriendsTab(),
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
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
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
