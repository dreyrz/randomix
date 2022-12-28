import '../../../../core/utils/mixins/_mixins.dart';
import 'album_model.dart';
import 'artist_model.dart';

import '../../../../core/entities/_entities.dart';

class TrackModel extends Track with ListUtils {
  TrackModel(Map<String, dynamic> map)
      : super(
          id: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["id"],
          name: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["name"],
          genre: map['genre'] != null ? map['genre'] as String : null,
          type: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["type"],
          externalUrl: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]
              ["external_urls"]["spotify"],
          previewUrl: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]
              ["preview_url"],
          date: DateTime.now(),
          album: AlbumModel(map),
          artists: (ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["artists"]
                  as List?)
              ?.map((artistMap) => ArtistModel(artistMap))
              .toList(),
        );
}
