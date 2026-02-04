/// Represents a factory building that can be placed on the factory map.
///
/// Factory buildings can have either a local PNG asset or a network GIF URL.
class FactoryBuilding {
  final String id;
  final String name;
  final String? localAsset;
  final String? networkGifUrl;
  final String route;
  final double positionX;
  final double positionY;
  final double width;
  final double height;

  const FactoryBuilding({
    required this.id,
    required this.name,
    this.localAsset,
    this.networkGifUrl,
    required this.route,
    required this.positionX,
    required this.positionY,
    this.width = 150.0,
    this.height = 150.0,
  }) : assert(
          localAsset != null || networkGifUrl != null,
          'Either localAsset or networkGifUrl must be provided',
        );

  /// Whether this building uses a local PNG asset.
  bool get isLocalAsset => localAsset != null;

  /// Whether this building uses a network GIF.
  bool get isNetworkGif => networkGifUrl != null;

  /// Gets the asset path or URL to display.
  String get displayAsset => localAsset ?? networkGifUrl ?? '';

  FactoryBuilding copyWith({
    String? id,
    String? name,
    String? localAsset,
    String? networkGifUrl,
    String? route,
    double? positionX,
    double? positionY,
    double? width,
    double? height,
  }) {
    return FactoryBuilding(
      id: id ?? this.id,
      name: name ?? this.name,
      localAsset: localAsset ?? this.localAsset,
      networkGifUrl: networkGifUrl ?? this.networkGifUrl,
      route: route ?? this.route,
      positionX: positionX ?? this.positionX,
      positionY: positionY ?? this.positionY,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
