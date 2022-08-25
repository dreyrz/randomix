import 'album.dart';
import 'artist.dart';

class Track {
  final String? id;
  final String? name;
  final String? type;
  final String? externalUrl;
  final String? previewUrl;
  final DateTime? date;
  final Album? album;
  final List<Artist>? artists;

  const Track({
    required this.id,
    required this.name,
    required this.type,
    required this.externalUrl,
    required this.previewUrl,
    required this.date,
    required this.album,
    required this.artists,
  });

  Track copyWith({
    String? id,
    String? name,
    String? type,
    String? externalUrl,
    String? previewUrl,
    DateTime? date,
    Album? album,
    List<Artist>? artists,
  }) {
    return Track(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      externalUrl: externalUrl ?? this.externalUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      date: date ?? this.date,
      album: album ?? this.album,
      artists: artists ?? this.artists,
    );
  }

  bool get isInvalid =>
      id == null ||
      name == null ||
      type == null ||
      externalUrl == null ||
      previewUrl == null ||
      album == null ||
      artists == null;

  @override
  String toString() {
    return 'Track(id: $id, name: $name, type: $type, externalUrl: $externalUrl, previewUrl: $previewUrl, date: $date, album: $album, artists: $artists)';
  }
}
