import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/widgets/app_scaffold.dart';
import 'package:farm_game/features/farm/data/datasources/farm_local_datasource.dart';
import 'package:farm_game/features/farm/data/repositories/farm_repository_impl.dart';
import 'package:farm_game/features/farm/game/farm_game.dart';

class FarmMainScreen extends StatefulWidget {
  const FarmMainScreen({super.key});

  @override
  State<FarmMainScreen> createState() => _FarmMainScreenState();
}

class _FarmMainScreenState extends State<FarmMainScreen> {
  late final FarmGame _farmGame;

  @override
  void initState() {
    super.initState();
    final repository = FarmRepositoryImpl(FarmLocalDatasource());
    final buildings = repository.getBuildings();

    _farmGame = FarmGame(
      buildings: buildings,
      onBuildingTap: (building) {
        Navigator.pushNamed(context, building.route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.farmBackground,
      backgroundAsset: AppAssets.farmBackground,
      safeAreaTop: false,
      safeAreaBottom: false,
      safeAreaLeft: false,
      safeAreaRight: false,
      body: Stack(
        children: [
          // Flame game with positioned buildings
          Positioned.fill(
            child: GameWidget(game: _farmGame),
          ),
          // Clouds overlay
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
          // Profile button
          Positioned(
            top: AppDimens.paddingMd + MediaQuery.of(context).padding.top,
            left: AppDimens.paddingMd,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                width: AppDimens.iconLg,
                height: AppDimens.iconLg,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.panelBorder,
                    width: AppDimens.cardBorderWidth,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    AppAssets.avatarPlaceholder,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
