import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/features/factory/domain/models/inventory_item.dart';
import 'package:farm_game/features/factory/domain/models/recipe.dart';

class FactoryLocalDatasource {
  Recipe getCakeRecipe() {
    return const Recipe(
      id: 'cake',
      name: 'Cake',
      ingredientAsset: AppAssets.meat,
      productAsset: AppAssets.cake,
    );
  }

  List<InventoryItem> getInventory() {
    return const [
      InventoryItem(
        id: 'egg',
        name: 'Egg',
        asset: AppAssets.egg,
        count: 0,
      ),
      InventoryItem(
        id: 'meat',
        name: 'Meat',
        asset: AppAssets.meat,
        count: 1,
      ),
    ];
  }
}
