import '../../../../core/utils/mixins/_mixins.dart';
import '../../../../core/entities/_entities.dart';

class AlbumModel extends Album with ListUtils {
  AlbumModel(Map<String, dynamic> map)
      : super(
          id: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["album"]["id"],
          name: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["album"]["name"],
          type: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["album"]["type"],
          cover: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["album"]
              ["images"][0]["url"],
          externalUrl: ListUtils.guaranteeNotEmpty(map["tracks"])?[0]["album"]
              ["external_urls"]["spotify"],
        );
}
