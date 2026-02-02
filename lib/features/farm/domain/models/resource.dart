class Resource {
  final String id;
  final String name;
  final String asset;
  final int count;

  const Resource({
    required this.id,
    required this.name,
    required this.asset,
    required this.count,
  });

  Resource copyWith({
    String? id,
    String? name,
    String? asset,
    int? count,
  }) {
    return Resource(
      id: id ?? this.id,
      name: name ?? this.name,
      asset: asset ?? this.asset,
      count: count ?? this.count,
    );
  }
}
