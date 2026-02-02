import 'package:farm_game/features/factory/data/datasources/factory_local_datasource.dart';
import 'package:farm_game/features/factory/domain/models/inventory_item.dart';
import 'package:farm_game/features/factory/domain/models/recipe.dart';

class FactoryRepositoryImpl {
  final FactoryLocalDatasource _localDatasource;

  FactoryRepositoryImpl(this._localDatasource);

  Recipe getCakeRecipe() {
    return _localDatasource.getCakeRecipe();
  }

  List<InventoryItem> getInventory() {
    return _localDatasource.getInventory();
  }
}
