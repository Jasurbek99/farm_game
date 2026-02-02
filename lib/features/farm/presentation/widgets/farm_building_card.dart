import 'package:flutter/material.dart';
import 'package:farm_game/core/widgets/building_card.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';

class FarmBuildingCard extends StatelessWidget {
  final Building building;
  final VoidCallback onTap;

  const FarmBuildingCard({
    super.key,
    required this.building,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BuildingCard(
      buildingAsset: building.asset,
      label: building.name,
      onTap: onTap,
    );
  }
}
