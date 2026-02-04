import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:farm_game/features/farm/domain/models/building.dart';

/// A Flame component that displays a farm building.
/// Supports tap interaction and will support GIF animations in the future.
class BuildingComponent extends PositionComponent with TapCallbacks {
  final Building building;
  final VoidCallback? onTap;
  final Vector2 gameSize;

  SpriteComponent? _spriteComponent;
  TextComponent? _labelComponent;
  bool _isLoaded = false;

  BuildingComponent({
    required this.building,
    required this.gameSize,
    this.onTap,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Set initial position and size
    updatePosition(gameSize);

    // Load the building sprite from local asset
    final sprite = await Sprite.load(
      building.localAsset.replaceFirst('assets/images/', ''),
    );

    _spriteComponent = SpriteComponent(
      sprite: sprite,
      size: size,
      anchor: Anchor.topLeft,
    );
    add(_spriteComponent!);

    // Add label - will be positioned by name card in design
    _labelComponent = TextComponent(
      text: building.name,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontFamily: 'Digitalt',
          fontSize: 12,
          color: Color(0xFF5D4037),
          fontWeight: FontWeight.bold,
        ),
      ),
      anchor: Anchor.center,
    );
    add(_labelComponent!);

    _isLoaded = true;
    _updateChildPositions();
  }

  /// Update position and size based on game canvas size.
  /// Called when the game resizes.
  void updatePosition(Vector2 newGameSize) {
    // Calculate actual position from normalized coordinates
    final x = building.position.dx * newGameSize.x;
    final y = building.position.dy * newGameSize.y;

    // Calculate actual size from normalized size
    final w = building.size.width * newGameSize.x;
    final h = building.size.height * newGameSize.y;

    position = Vector2(x, y);
    size = Vector2(w, h);

    if (_isLoaded) {
      _updateChildPositions();
    }
  }

  void _updateChildPositions() {
    // Update sprite size to match component
    _spriteComponent?.size = size;

    // Position label at bottom-left of building
    _labelComponent?.position = Vector2(size.x * 0.25, size.y * 0.15);
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTap?.call();
  }

  @override
  bool containsLocalPoint(Vector2 point) {
    return point.x >= 0 &&
        point.x <= size.x &&
        point.y >= 0 &&
        point.y <= size.y;
  }
}
