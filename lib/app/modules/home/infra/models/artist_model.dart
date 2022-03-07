import '../../domain/entities/artist.dart';

class ArtistModel extends Artist {
  ArtistModel(Map<String, dynamic> map)
      : super(
          id: map["id"],
          name: map["name"],
          type: map["type"],
          externalUrl: map["external_urls"]["spotify"],
        );
}
