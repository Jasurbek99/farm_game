import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/features/store/domain/models/store_item.dart';

class StoreLocalDatasource {
  List<StoreItem> getItems() {
    return const [
      StoreItem(
        id: 'egg',
        name: AppStrings.egg,
        asset: AppAssets.egg,
        price: 500,
        category: AppStrings.product,
      ),
      StoreItem(
        id: 'meat',
        name: AppStrings.meat,
        asset: AppAssets.meat,
        price: 500,
        category: AppStrings.product,
      ),
      StoreItem(
        id: 'silk',
        name: AppStrings.silk,
        asset: AppAssets.silk,
        price: 500,
        category: AppStrings.product,
      ),
      StoreItem(
        id: 'meat2',
        name: AppStrings.meat,
        asset: AppAssets.meat,
        price: 500,
        category: AppStrings.product,
      ),
      StoreItem(
        id: 'chicken',
        name: AppStrings.chicken,
        asset: AppAssets.chicken,
        price: 500,
        category: AppStrings.animal,
      ),

      StoreItem(
        id: 'cow',
        name: AppStrings.cow,
        asset: AppAssets.cow,
        price: 500,
        category: AppStrings.animal,
      ),
      StoreItem(
        id: 'pig',
        name: AppStrings.pig,
        asset: AppAssets.pig,
        price: 500,
        category: AppStrings.animal,
      ),
      StoreItem(
        id: 'sheep',
        name: AppStrings.sheep,
        asset: AppAssets.sheep,
        price: 500,
        category: AppStrings.animal,
      ),
    ];
  }
}
