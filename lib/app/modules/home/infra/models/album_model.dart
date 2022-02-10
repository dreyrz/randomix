import '../../domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({
    required String id,
    required String name,
    required String type,
    required String albumCover,
    required String externalUrl,
  }) : super(
          id: id,
          name: name,
          type: type,
          albumCover: albumCover,
          externalUrl: externalUrl,
        );

  static AlbumModel fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map["tracks"][0]["album"]["id"],
      name: map["tracks"][0]["album"]["name"],
      type: map["tracks"][0]["album"]["type"],
      albumCover: map["tracks"][0]["album"]["images"][0]["url"],
      externalUrl: map["tracks"][0]["album"]["external_urls"]["spotify"],
    );
  }
}
