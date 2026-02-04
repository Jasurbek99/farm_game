import 'package:farm_game/features/farm/data/datasources/farm_local_datasource.dart';
import 'package:farm_game/features/farm/data/datasources/farm_remote_datasource.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';
import 'package:farm_game/features/farm/domain/models/resource.dart';

/// Repository for farm data.
///
/// Strategy:
/// 1. Always return local data immediately for fast UI
/// 2. Optionally fetch remote data to get network asset URLs (GIFs)
/// 3. Merge remote data with local data when available
class FarmRepositoryImpl {
  final FarmLocalDatasource _localDatasource;
  final FarmRemoteDatasource? _remoteDatasource;

  FarmRepositoryImpl(
    this._localDatasource, [
    this._remoteDatasource,
  ]);

  /// Returns buildings from local datasource.
  /// Use [getBuildingsWithNetworkAssets] for network-enabled buildings.
  List<Building> getBuildings() {
    return _localDatasource.getBuildings();
  }

  /// Fetches buildings with network asset URLs from backend.
  /// Falls back to local data if remote fails.
  Future<List<Building>> getBuildingsWithNetworkAssets() async {
    if (_remoteDatasource == null) {
      return _localDatasource.getBuildings();
    }

    try {
      final remoteBuildings = await _remoteDatasource.fetchBuildings();
      return _mergeBuildings(
        _localDatasource.getBuildings(),
        remoteBuildings,
      );
    } catch (e) {
      // Fallback to local data on network error
      return _localDatasource.getBuildings();
    }
  }

  /// Merges local buildings with remote data.
  /// Remote data provides network asset URLs, local provides fallbacks.
  List<Building> _mergeBuildings(
    List<Building> local,
    List<Building> remote,
  ) {
    final remoteMap = {for (final b in remote) b.id: b};

    return local.map((localBuilding) {
      final remoteBuilding = remoteMap[localBuilding.id];
      if (remoteBuilding?.networkAssetUrl != null) {
        return localBuilding.copyWith(
          networkAssetUrl: remoteBuilding!.networkAssetUrl,
          isAnimated: remoteBuilding.isAnimated,
        );
      }
      return localBuilding;
    }).toList();
  }

  Resource getEggResource() {
    return _localDatasource.getEggResource();
  }

  Resource getEnergyResource() {
    return _localDatasource.getEnergyResource();
  }
}
