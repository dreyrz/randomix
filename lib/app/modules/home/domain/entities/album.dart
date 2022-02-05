class Album {
  final int id;
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
}
