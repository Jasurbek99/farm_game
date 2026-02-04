import 'dart:ui';

/// Represents a farm building that can be displayed on the farm map.
/// Supports both local assets (PNG) and network assets (GIF from backend).
class Building {
  final String id;
  final String name;
  final String localAsset;
  final String? networkAssetUrl;
  final String route;
  final Offset position;
  final Size size;
  final bool isAnimated;

  const Building({
    required this.id,
    required this.name,
    required this.localAsset,
    this.networkAssetUrl,
    required this.route,
    required this.position,
    required this.size,
    this.isAnimated = false,
  });

  /// Returns the asset to use - prefers network URL if available
  String get displayAsset => networkAssetUrl ?? localAsset;

  /// Whether this building should load from network
  bool get isNetworkAsset => networkAssetUrl != null;

  /// Create a copy with updated network asset URL (for backend updates)
  Building copyWith({
    String? id,
    String? name,
    String? localAsset,
    String? networkAssetUrl,
    String? route,
    Offset? position,
    Size? size,
    bool? isAnimated,
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      localAsset: localAsset ?? this.localAsset,
      networkAssetUrl: networkAssetUrl ?? this.networkAssetUrl,
      route: route ?? this.route,
      position: position ?? this.position,
      size: size ?? this.size,
      isAnimated: isAnimated ?? this.isAnimated,
    );
  }
}
