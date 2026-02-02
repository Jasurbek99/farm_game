import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/core/widgets/panel_card.dart';
import 'package:farm_game/features/store/data/datasources/store_local_datasource.dart';
import 'package:farm_game/features/store/data/repositories/store_repository_impl.dart';
import 'package:farm_game/features/store/presentation/widgets/store_item_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _selectedTabIndex = 0;
  String _selectedCategory = AppStrings.product;

  @override
  Widget build(BuildContext context) {
    final repository = StoreRepositoryImpl(StoreLocalDatasource());
    final items = repository.getItems();

    return AppScaffold(
      backgroundColor: AppColors.storeBackground,
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
                AppStrings.store,
                style: AppTextStyles.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimens.paddingMd),
              // Buy/Sell tabs
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingMd,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _TabButton(
                        label: AppStrings.buy,
                        isSelected: _selectedTabIndex == 0,
                        backgroundColor: AppColors.buttonYellow,
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
                        label: AppStrings.sell,
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
              ),
              const SizedBox(height: AppDimens.paddingMd),
              // Store content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingMd),
                  child: PanelCard(
                    child: Column(
                      children: [
                        // Category tabs
                        Row(
                          children: [
                            Expanded(
                              child: _CategoryButton(
                                label: AppStrings.animal,
                                isSelected: _selectedCategory == AppStrings.animal,
                                backgroundColor: AppColors.buttonBrown,
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = AppStrings.animal;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: AppDimens.paddingMd),
                            Expanded(
                              child: _CategoryButton(
                                label: AppStrings.product,
                                isSelected: _selectedCategory == AppStrings.product,
                                backgroundColor: AppColors.buttonYellow,
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = AppStrings.product;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimens.paddingMd),
                        // Items grid
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppDimens.paddingMd,
                              mainAxisSpacing: AppDimens.paddingMd,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return StoreItemCard(
                                item: item,
                                onTap: () {},
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
  final Color backgroundColor;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.buttonHeightSmall,
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : AppColors.buttonBrown.withOpacity(0.5),
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
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _CategoryButton({
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.buttonHeightSmall,
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : AppColors.buttonBrown,
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
          ),
        ),
      ),
    );
  }
}
