import '../../domain/entities/album.dart';

class AlbumModel extends Album {
  AlbumModel(Map<String, dynamic> map)
      : super(
          id: map["tracks"][0]["album"]["id"],
          name: map["tracks"][0]["album"]["name"],
          type: map["tracks"][0]["album"]["type"],
          albumCover: map["tracks"][0]["album"]["images"][0]["url"],
          externalUrl: map["tracks"][0]["album"]["external_urls"]["spotify"],
        );
}
