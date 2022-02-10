import 'package:randomix/app/modules/home/infra/models/album_model.dart';
import 'package:randomix/app/modules/home/infra/models/artist_model.dart';

import '../../domain/entities/track.dart';

class TrackModel extends Track {
  const TrackModel({
    required String id,
    required String name,
    required String type,
    required String externalUrl,
    required DateTime date,
    required AlbumModel album,
    required List<ArtistModel> artists,
  }) : super(
          id: id,
          name: name,
          type: type,
          externalUrl: externalUrl,
          date: date,
          album: album,
          artists: artists,
        );

  static TrackModel fromMap(Map<String, dynamic> map) {
    return TrackModel(
      id: map["tracks"][0]["id"],
      name: map["tracks"][0]["name"],
      type: map["tracks"][0]["type"],
      externalUrl: map["tracks"][0]["external_urls"]["spotify"],
      date: DateTime.now(),
      album: AlbumModel.fromMap(map),
      artists: (map["tracks"][0]["artists"] as List)
          .map((artistMap) => ArtistModel.fromMap(artistMap))
          .toList(),
    );
  }
}
