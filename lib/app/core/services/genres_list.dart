import 'package:get/get.dart';

abstract class IGenresListService {
  List<String> get genres;
  void addGenres(List<String> genres);
}

class GenresListService extends GetxService implements IGenresListService {
  final _genres = <String>['aleatório'];
  @override
  List<String> get genres => _genres;

  @override
  void addGenres(List<String> genres) => _genres.addAll(genres);
}
