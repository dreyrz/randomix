class Album {
  final String id;
  final String name;
  final String externalUrl;
  final String type;
  final String albumCover;
  const Album({
    required this.id,
    required this.name,
    required this.type,
    required this.albumCover,
    required this.externalUrl,
  });

  Album copyWith({
    String? id,
    String? name,
    String? externalUrl,
    String? type,
    String? albumCover,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      externalUrl: externalUrl ?? this.externalUrl,
      type: type ?? this.type,
      albumCover: albumCover ?? this.albumCover,
    );
  }
}
