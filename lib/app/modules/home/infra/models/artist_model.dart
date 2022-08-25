import '../../../../core/entities/_entities.dart';

class ArtistModel extends Artist {
  ArtistModel(Map<String, dynamic> map)
      : super(
          id: map["id"],
          name: map["name"],
          type: map["type"],
          externalUrl: map["external_urls"]["spotify"],
        );
}
