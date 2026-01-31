import 'package:farm_game/features/farm/data/datasources/farm_local_datasource.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';
import 'package:farm_game/features/farm/domain/models/resource.dart';

class FarmRepositoryImpl {
  final FarmLocalDatasource _localDatasource;

  FarmRepositoryImpl(this._localDatasource);

  List<Building> getBuildings() {
    return _localDatasource.getBuildings();
  }

  Resource getEggResource() {
    return _localDatasource.getEggResource();
  }

  Resource getEnergyResource() {
    return _localDatasource.getEnergyResource();
  }
}
