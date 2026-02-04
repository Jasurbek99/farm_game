import 'dart:ui';

import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_strings.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';

/// Remote datasource for fetching farm data from backend.
/// Currently returns mock data simulating backend response.
///
/// When backend is ready:
/// 1. Replace mock data with actual API calls
/// 2. Buildings will include networkAssetUrl for GIF animations
/// 3. isAnimated will be true for animated buildings
class FarmRemoteDatasource {
  final String baseUrl;

  FarmRemoteDatasource({this.baseUrl = 'https://api.farmgame.com'});

  /// Fetches buildings from backend.
  /// Returns buildings with network asset URLs for GIF animations.
  Future<List<Building>> fetchBuildings() async {
    // TODO: Replace with actual API call
    // final response = await http.get(Uri.parse('$baseUrl/buildings'));
    // return _parseBuildingsResponse(response.body);

    // Mock response simulating backend data
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      Building(
        id: 'chicken',
        name: AppStrings.chickenBarn,
        localAsset: AppAssets.chickenBarn,
        // networkAssetUrl will come from backend
        // networkAssetUrl: 'https://api.farmgame.com/assets/chicken_barn.gif',
        route: '/farm/chicken',
        position: Offset(0.05, 0.08),
        size: Size(0.55, 0.22),
        isAnimated: false, // Will be true when GIF is available
      ),
      Building(
        id: 'sheep',
        name: AppStrings.sheepBarn,
        localAsset: AppAssets.sheepBarn,
        route: '/farm/sheep',
        position: Offset(0.40, 0.26),
        size: Size(0.58, 0.22),
        isAnimated: false,
      ),
      Building(
        id: 'cow',
        name: AppStrings.cowBarn,
        localAsset: AppAssets.cowBarn,
        route: '/farm/cow',
        position: Offset(0.02, 0.44),
        size: Size(0.55, 0.20),
        isAnimated: false,
      ),
      Building(
        id: 'pig',
        name: AppStrings.pigBarn,
        localAsset: AppAssets.pigBarn,
        route: '/farm/pig',
        position: Offset(0.25, 0.62),
        size: Size(0.60, 0.24),
        isAnimated: false,
      ),
    ];
  }

  /// Fetches a single building's updated asset URL.
  /// Useful for refreshing GIF URLs or getting updated animations.
  Future<String?> fetchBuildingAssetUrl(String buildingId) async {
    // TODO: Replace with actual API call
    // final response = await http.get(Uri.parse('$baseUrl/buildings/$buildingId/asset'));
    // return response.body;

    await Future.delayed(const Duration(milliseconds: 100));
    return null; // No network assets yet
  }
}
