import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/features/factory/domain/models/factory_building.dart';
import 'package:farm_game/features/factory/presentation/widgets/factory_map_building.dart';

/// A draggable and pannable factory map widget.
///
/// Users can touch and drag to pan around the map to see all buildings.
/// The map displays the factory background with buildings positioned on it.
class DraggableFactoryMap extends StatefulWidget {
  final List<FactoryBuilding> buildings;
  final void Function(FactoryBuilding building)? onBuildingTap;
  final String? mapBackgroundAsset;
  final double mapWidth;
  final double mapHeight;
  final double minScale;
  final double maxScale;
  final double initialScale;

  const DraggableFactoryMap({
    super.key,
    required this.buildings,
    this.onBuildingTap,
    this.mapBackgroundAsset,
    this.mapWidth = 1200.0,
    this.mapHeight = 900.0,
    this.minScale = 0.5,
    this.maxScale = 2.0,
    this.initialScale = 1.0,
  });

  @override
  State<DraggableFactoryMap> createState() => _DraggableFactoryMapState();
}

class _DraggableFactoryMapState extends State<DraggableFactoryMap> {
  late TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();

    // Set initial scale and position after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerMap();
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _centerMap() {
    if (!mounted) return;

    final viewportSize = MediaQuery.of(context).size;
    final scale = widget.initialScale;

    // Calculate the offset to center the map
    final scaledMapWidth = widget.mapWidth * scale;
    final scaledMapHeight = widget.mapHeight * scale;

    final offsetX = (scaledMapWidth - viewportSize.width) / 2;
    final offsetY = (scaledMapHeight - viewportSize.height) / 2;

    final matrix = Matrix4.identity()
      ..scale(scale)
      ..translate(-offsetX / scale, -offsetY / scale);

    _transformationController.value = matrix;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: InteractiveViewer(
        transformationController: _transformationController,
        minScale: widget.minScale,
        maxScale: widget.maxScale,
        boundaryMargin: const EdgeInsets.all(100.0),
        constrained: false,
        child: SizedBox(
          width: widget.mapWidth,
          height: widget.mapHeight,
          child: Stack(
            children: [
              // Map background
              Positioned.fill(
                child: _buildMapBackground(),
              ),
              // Buildings
              ...widget.buildings.map((building) {
                return Positioned(
                  left: building.positionX,
                  top: building.positionY,
                  child: FactoryMapBuilding(
                    building: building,
                    onTap: widget.onBuildingTap != null
                        ? () => widget.onBuildingTap!(building)
                        : null,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapBackground() {
    final backgroundAsset =
        widget.mapBackgroundAsset ?? AppAssets.factoryMapEmpty;

    return Image.asset(
      backgroundAsset,
      width: widget.mapWidth,
      height: widget.mapHeight,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to colored background if image fails to load
        return Container(
          width: widget.mapWidth,
          height: widget.mapHeight,
          color: AppColors.factoryBackground,
        );
      },
    );
  }
}
