import '../../domain/entities/track.dart';

abstract class IHomeDatasource {
  Future<Track> getRandomTrackByGenre(String genre, {int limit, String market});

  Future<List<String>> getGenres();
}
