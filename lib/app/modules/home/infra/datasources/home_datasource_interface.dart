import '../../../../core/entities/_entities.dart';

abstract class IHomeDatasource {
  Future<Track> getRandomTrackByGenre(String genre, {int limit, String market});
}
