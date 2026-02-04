import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/factory/domain/models/factory_building.dart';
import 'package:farm_game/features/factory/presentation/widgets/draggable_factory_map.dart';

/// Factory main screen with a draggable/pannable map.
///
/// Users can touch and drag to pan around the factory map to see all buildings.
/// Buildings can display either local PNG assets or network GIF animations.
class FactoryMainScreen extends StatelessWidget {
  const FactoryMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Factory buildings with their positions on the map
    // Positions are based on the isometric grid layout shown in the design
    final buildings = _getFactoryBuildings();

    return AppScaffold(
      backgroundColor: AppColors.black,
      safeAreaTop: false,
      safeAreaLeft: false,
      safeAreaRight: false,
      body: Stack(
        children: [
          // Draggable factory map (takes full screen below title)
          Positioned.fill(
            child: DraggableFactoryMap(
              buildings: buildings,
              mapBackgroundAsset: AppAssets.factoryMapEmpty,
              mapWidth: 1200.0,
              mapHeight: 900.0,
              minScale: 0.6,
              maxScale: 2.0,
              initialScale: 0.9,
              onBuildingTap: (building) {
                Navigator.pushNamed(context, building.route);
              },
            ),
          ),
          // Clouds overlay (top layer)
          Positioned(
            top: 20,
            left: 0,
            child: IgnorePointer(
              child: Image.asset(
                AppAssets.cloudLeft,
                fit: BoxFit.none,
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: IgnorePointer(
              child: Image.asset(
                AppAssets.cloudRight,
                fit: BoxFit.none,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          // Title overlay
          Positioned(
            top: AppDimens.paddingLg,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Text(
                AppStrings.welcomeToFactory,
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.whiteTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the list of factory buildings with their map positions.
  ///
  /// Building positions are arranged in an isometric grid pattern.
  /// Each building can have either a local PNG asset or a network GIF URL.
  List<FactoryBuilding> _getFactoryBuildings() {
    return const [
      // Top row - left
      FactoryBuilding(
        id: 'weaving_mill',
        name: AppStrings.weavingMill,
        localAsset: AppAssets.factoryWeavingMill,
        // Example: Can also use network GIF
        // networkGifUrl: 'https://example.com/weaving_mill.gif',
        route: '/factory/weaving',
        positionX: 220.0,
        positionY: 150.0,
        width: 150.0,
        height: 150.0,
      ),
      // Top row - right
      FactoryBuilding(
        id: 'sugar_mill',
        name: AppStrings.sugarMill,
        localAsset: AppAssets.factorySugarMill,
        route: '/factory/sugar',
        positionX: 550.0,
        positionY: 150.0,
        width: 150.0,
        height: 150.0,
      ),
      // Second row - left
      FactoryBuilding(
        id: 'bbq_station',
        name: AppStrings.bbqStation,
        localAsset: AppAssets.factoryBbqStation,
        route: '/factory/bbq',
        positionX: 150.0,
        positionY: 280.0,
        width: 160.0,
        height: 160.0,
      ),
      // Second row - right
      FactoryBuilding(
        id: 'meat_shop',
        name: AppStrings.meatShop,
        localAsset: AppAssets.factoryMeatShop,
        route: '/factory/meat',
        positionX: 620.0,
        positionY: 280.0,
        width: 150.0,
        height: 150.0,
      ),
      // Third row - left
      FactoryBuilding(
        id: 'ice_cream_shop',
        name: AppStrings.iceCreamShop,
        localAsset: AppAssets.factoryIceCreamShop,
        route: '/factory/ice_cream',
        positionX: 100.0,
        positionY: 450.0,
        width: 150.0,
        height: 150.0,
      ),
      // Third row - center
      FactoryBuilding(
        id: 'dairy_factory',
        name: AppStrings.dairyFactory,
        localAsset: AppAssets.factoryDairyFactory,
        route: '/factory/dairy',
        positionX: 400.0,
        positionY: 520.0,
        width: 160.0,
        height: 160.0,
      ),
      // Third row - right
      FactoryBuilding(
        id: 'bakery',
        name: AppStrings.bakery,
        localAsset: AppAssets.factoryBakery,
        route: '/factory/bakery',
        positionX: 680.0,
        positionY: 450.0,
        width: 150.0,
        height: 150.0,
      ),
      // Cake factory - uses existing asset
      FactoryBuilding(
        id: 'cake',
        name: AppStrings.cakeFactory,
        localAsset: AppAssets.cakeFactory,
        route: '/factory/cake',
        positionX: 280.0,
        positionY: 400.0,
        width: 140.0,
        height: 140.0,
      ),
    ];
  }
}
