import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/factory/presentation/widgets/factory_building_card.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';

class FactoryMainScreen extends StatelessWidget {
  const FactoryMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const buildings = [
      Building(
        id: 'cake',
        name: AppStrings.cakeFactory,
        asset: AppAssets.cakeFactory,
        route: '/factory/cake',
      ),
    ];

    return AppScaffold(
      backgroundColor: AppColors.factoryBackground,
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.welcomeToFactory,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.whiteTextColor,
                  ),
                  textAlign: TextAlign.center,
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
                        child: FactoryBuildingCard(
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
