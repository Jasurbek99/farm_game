import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/farm/data/datasources/farm_local_datasource.dart';
import 'package:farm_game/features/farm/data/repositories/farm_repository_impl.dart';
import 'package:farm_game/features/farm/presentation/widgets/farm_building_card.dart';

class FarmMainScreen extends StatelessWidget {
  const FarmMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = FarmRepositoryImpl(FarmLocalDatasource());
    final buildings = repository.getBuildings();

    return AppScaffold(
      backgroundColor: AppColors.farmBackground,
      backgroundAsset: AppAssets.farmBackground,
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
          // Profile button
          Positioned(
            top: AppDimens.paddingMd,
            left: AppDimens.paddingMd,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                width: AppDimens.iconLg,
                height: AppDimens.iconLg,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.panelBorder,
                    width: AppDimens.cardBorderWidth,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    AppAssets.avatarPlaceholder,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Content
          Column(
            children: [
              const SizedBox(height: AppDimens.paddingLg),
              // Title
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.welcomeToFarm,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.primary,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimens.paddingSm),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.paddingLg),
              // Buildings
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimens.paddingMd),
                  child: Column(
                    children: buildings.map((building) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimens.paddingLg,
                        ),
                        child: FarmBuildingCard(
                          building: building,
                          onTap: () {
                            Navigator.pushNamed(context, building.route);
                          },
                        ),
                      );
                    }).toList(),
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
