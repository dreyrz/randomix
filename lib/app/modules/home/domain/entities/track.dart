import 'album.dart';
import 'artist.dart';

class Track {
  final String id;
  final String name;

  final String type;
  final String externalUrl;
  final DateTime? date;
  final Album album;
  final List<Artist> artists;

  const Track({
    required this.id,
    required this.name,
    required this.type,
    required this.externalUrl,
    required this.date,
    required this.album,
    required this.artists,
  });
}
