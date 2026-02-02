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
      safeAreaLeft: false,
      safeAreaRight: false,
      body: Stack(
        children: [
          // Clouds
          // Positioned(
          //   top: 20,
          //   width: MediaQuery.of(context).size.width,
          //   child: Image.asset(
          //     AppAssets.farmBackground,
          //     fit: BoxFit.cover,
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     height: MediaQuery.of(context).size.height * 0.8,
          //     //width: AppDimens.iconXl * 2,
          //   ),
          // ),
          Positioned(
            top: AppDimens.paddingLg,
            left: 0,
            child: Image.asset(AppAssets.cloud1, width: AppDimens.iconXl * 2),
          ),
          Positioned(
            top: AppDimens.paddingXl,
            right: 0,
            child: Image.asset(AppAssets.cloud2, width: AppDimens.iconXl * 2),
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
                      AppStrings.welcomeFarmTitle,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.primary,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDimens.paddingSm),
                    Semantics(
                      label: AppStrings.welcomeToFarm,
                      image: true,
                      child: Image.asset(
                        AppAssets.farmName,
                        width: AppDimens.iconXl * 2,
                        fit: BoxFit.contain,
                      ),
                    ),
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
