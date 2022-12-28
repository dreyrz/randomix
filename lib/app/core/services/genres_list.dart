import 'dart:math';

import 'package:get/get.dart';

import '../constants/_constants.dart';

abstract class IGenresListService {
  void addGenres(List<String> genres);
  String getRandomGenre({Random? random});
  List<String> get genres;
  String get currentGenre;
  bool get isRandomGenreSelected;
  set currentGenre(String genre);
}

class GenresListService extends GetxService implements IGenresListService {
  final IStrings _strings;
  GenresListService(this._strings);

  late final _genres = <String>[_strings.random];
  late String _currentGenre = _strings.random;

  @override
  List<String> get genres => _genres.skip(1).toList();

  @override
  bool get isRandomGenreSelected => _currentGenre == _strings.random;

  @override
  String get currentGenre => _currentGenre;

  @override
  set currentGenre(String genre) => _currentGenre = genre;

  @override
  void addGenres(List<String> genres) => _genres.addAll(genres);

  @override
  String getRandomGenre({Random? random}) {
    random ??= Random();
    final index = random.nextInt(genres.length);
    return genres[index];
  }
}
