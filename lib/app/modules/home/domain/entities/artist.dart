class Artist {
  final String id;
  final String name;
  final String externalUrl;
  final String type;

  const Artist({
    required this.id,
    required this.name,
    required this.type,
    required this.externalUrl,
  });

  Artist copyWith({
    String? id,
    String? name,
    String? externalUrl,
    String? type,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      externalUrl: externalUrl ?? this.externalUrl,
      type: type ?? this.type,
    );
  }
}
