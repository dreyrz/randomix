import '../../domain/entities/artist.dart';

class ArtistModel extends Artist {
  const ArtistModel({
    required String id,
    required String name,
    required String type,
    required String externalUrl,
  }) : super(
          id: id,
          name: name,
          type: type,
          externalUrl: externalUrl,
        );
  static ArtistModel fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      id: map["id"],
      name: map["name"],
      type: map["type"],
      externalUrl: map["external_urls"]["spotify"],
    );
  }
}
