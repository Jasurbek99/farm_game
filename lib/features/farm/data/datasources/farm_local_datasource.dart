import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';
import 'package:farm_game/features/farm/domain/models/resource.dart';

class FarmLocalDatasource {
  List<Building> getBuildings() {
    return const [
      Building(
        id: 'chicken',
        name: AppStrings.chickenBarn,
        asset: AppAssets.chickenBarn,
        route: '/farm/chicken',
      ),
      Building(
        id: 'sheep',
        name: AppStrings.sheepBarn,
        asset: AppAssets.sheepBarn,
        route: '/farm/sheep',
      ),
      Building(
        id: 'cow',
        name: AppStrings.cowBarn,
        asset: AppAssets.cowBarn,
        route: '/farm/cow',
      ),
      Building(
        id: 'pig',
        name: AppStrings.pigBarn,
        asset: AppAssets.pigBarn,
        route: '/farm/pig',
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
