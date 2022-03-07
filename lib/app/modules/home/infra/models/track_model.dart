import 'package:randomix/app/modules/home/infra/models/album_model.dart';
import 'package:randomix/app/modules/home/infra/models/artist_model.dart';

import '../../domain/entities/track.dart';

class TrackModel extends Track {
  TrackModel(Map<String, dynamic> map)
      : super(
          id: map["tracks"][0]["id"],
          name: map["tracks"][0]["name"],
          type: map["tracks"][0]["type"],
          externalUrl: map["tracks"][0]["external_urls"]["spotify"],
          date: DateTime.now(),
          album: AlbumModel(map),
          artists: (map["tracks"][0]["artists"] as List)
              .map((artistMap) => ArtistModel(artistMap))
              .toList(),
        );
}
