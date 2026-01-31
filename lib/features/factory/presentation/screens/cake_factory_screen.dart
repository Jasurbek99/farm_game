import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/core/widgets/inventory_slot.dart';
import 'package:farm_game/core/widgets/panel_card.dart';
import 'package:farm_game/core/widgets/primary_button.dart';
import 'package:farm_game/features/factory/data/datasources/factory_local_datasource.dart';
import 'package:farm_game/features/factory/data/repositories/factory_repository_impl.dart';
import 'package:farm_game/features/factory/presentation/widgets/recipe_row.dart';

class CakeFactoryScreen extends StatelessWidget {
  const CakeFactoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = FactoryRepositoryImpl(FactoryLocalDatasource());
    final recipe = repository.getCakeRecipe();
    final inventory = repository.getInventory();

    return AppScaffold(
      backgroundColor: AppColors.factoryBackground,
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimens.paddingMd),
            child: Column(
              children: [
                // Title
                Text(
                  AppStrings.cakeFactory,
                  style: AppTextStyles.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimens.paddingLg),
                // Building image
                Image.asset(
                  AppAssets.cakeFactoryLarge,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: AppDimens.paddingLg),
                // Recipe panel
                PanelCard(
                  backgroundColor: AppColors.panelDark,
                  child: Column(
                    children: [
                      RecipeRow(recipe: recipe),
                      const SizedBox(height: AppDimens.paddingMd),
                      PrimaryButton(
                        text: AppStrings.makeCake,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimens.paddingMd),
                // Inventory panel
                PanelCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: inventory.map((item) {
                      return InventorySlot(
                        iconAsset: item.asset,
                        count: item.count,
                        onAddPressed: () {},
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
