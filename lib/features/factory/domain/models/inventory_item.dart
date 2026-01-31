class InventoryItem {
  final String id;
  final String name;
  final String asset;
  final int count;

  const InventoryItem({
    required this.id,
    required this.name,
    required this.asset,
    required this.count,
  });

  InventoryItem copyWith({
    String? id,
    String? name,
    String? asset,
    int? count,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      asset: asset ?? this.asset,
      count: count ?? this.count,
    );
  }
}
