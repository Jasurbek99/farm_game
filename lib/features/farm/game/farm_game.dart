import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';
import 'package:farm_game/features/farm/game/components/building_component.dart';

/// Main Flame game for the farm map.
/// Displays buildings at specific positions with tap interaction.
class FarmGame extends FlameGame {
  final List<Building> buildings;
  final void Function(Building building)? onBuildingTap;

  FarmGame({
    required this.buildings,
    this.onBuildingTap,
  });

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add building components at their designated positions
    for (final building in buildings) {
      final buildingComponent = BuildingComponent(
        building: building,
        gameSize: size,
        onTap: () => onBuildingTap?.call(building),
      );
      add(buildingComponent);
    }
  }

  @override
  void onGameResize(Vector2 newSize) {
    super.onGameResize(newSize);

    // Update building positions when screen size changes
    for (final component in children.whereType<BuildingComponent>()) {
      component.updatePosition(newSize);
    }
  }
}
