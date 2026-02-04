import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/core/widgets/resource_bar.dart';
import 'package:farm_game/core/widgets/title_banner.dart';
import 'package:farm_game/features/farm/data/datasources/farm_local_datasource.dart';
import 'package:farm_game/features/farm/data/repositories/farm_repository_impl.dart';
import 'package:farm_game/features/farm/presentation/widgets/grass_patch_widget.dart';

class ChickenBarnScreen extends StatelessWidget {
  const ChickenBarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = FarmRepositoryImpl(FarmLocalDatasource());
    final eggResource = repository.getEggResource();
    final energyResource = repository.getEnergyResource();

    return AppScaffold(
      backgroundColor: AppColors.farmBackground,
      backgroundAsset: AppAssets.chickenFarmBackground,
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
              const SizedBox(height: AppDimens.paddingMd),
              // Title
              const TitleBanner(title: AppStrings.chickenBarn),
              const SizedBox(height: AppDimens.paddingMd),
              // Resource bars
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingMd,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ResourceBar(
                        iconAsset: eggResource.asset,
                        current: eggResource.count,
                        max: 5,
                        barColor: AppColors.progressBar,
                        onAddPressed: () {},
                      ),
                    ),
                    const SizedBox(width: AppDimens.paddingSm),
                    Expanded(
                      child: ResourceBar(
                        iconAsset: energyResource.asset,
                        current: energyResource.count,
                        max: 200,
                        barColor: AppColors.energyBar,
                        onAddPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.paddingXl),
              // Chickens and eggs
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(AppDimens.paddingMd),
                  mainAxisSpacing: AppDimens.paddingMd,
                  crossAxisSpacing: AppDimens.paddingMd,
                  children: [
                    const GrassPatchWidget(itemAsset: AppAssets.chicken),
                    const GrassPatchWidget(itemAsset: AppAssets.chicken),
                    const GrassPatchWidget(),
                    const GrassPatchWidget(itemAsset: AppAssets.egg),
                    const GrassPatchWidget(),
                    const GrassPatchWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
