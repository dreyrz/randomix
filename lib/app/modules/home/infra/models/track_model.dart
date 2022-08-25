import 'package:randomix/app/modules/home/infra/models/album_model.dart';
import 'package:randomix/app/modules/home/infra/models/artist_model.dart';

import '../../domain/entities/track.dart';

class TrackModel extends Track with ListUtils {
  TrackModel(Map<String, dynamic> map)
      : super(
          id: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["id"],
          name: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["name"],
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

mixin ListUtils {
  static List<dynamic>? guaranteeNotEmpty(List<dynamic> list) =>
      list.isEmpty ? null : list;
}
