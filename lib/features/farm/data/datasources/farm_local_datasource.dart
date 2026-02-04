import 'dart:ui';

import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';
import 'package:farm_game/features/farm/domain/models/resource.dart';

class FarmLocalDatasource {
  /// Returns buildings with positions matching the design layout:
  /// - Chicken Barn: top-left
  /// - Sheep Barn: middle-right
  /// - Cow Barn: middle-left
  /// - Pig Barn: bottom-center
  ///
  /// Positions are normalized (0.0-1.0) and will be scaled to screen size.
  /// networkAssetUrl will be populated from backend when available.
  List<Building> getBuildings() {
    return const [
      Building(
        id: 'chicken',
        name: AppStrings.chickenBarn,
        localAsset: AppAssets.chickenBarn,
        route: '/farm/chicken',
        position: Offset(0.05, 0.08),
        size: Size(0.55, 0.22),
      ),
      Building(
        id: 'sheep',
        name: AppStrings.sheepBarn,
        localAsset: AppAssets.sheepBarn,
        route: '/farm/sheep',
        position: Offset(0.40, 0.26),
        size: Size(0.58, 0.22),
      ),
      Building(
        id: 'cow',
        name: AppStrings.cowBarn,
        localAsset: AppAssets.cowBarn,
        route: '/farm/cow',
        position: Offset(0.02, 0.44),
        size: Size(0.55, 0.20),
      ),
      Building(
        id: 'pig',
        name: AppStrings.pigBarn,
        localAsset: AppAssets.pigBarn,
        route: '/farm/pig',
        position: Offset(0.25, 0.62),
        size: Size(0.60, 0.24),
      ),
    ];
  }

  Resource getEggResource() {
    return const Resource(
      id: 'eggs',
      name: AppStrings.egg,
      asset: AppAssets.egg,
      count: 15,
    );
  }

  Resource getEnergyResource() {
    return const Resource(
      id: 'energy',
      name: 'Energy',
      asset: AppAssets.energyIcon,
      count: 120,
    );
  }
}
