import 'dart:async';

import 'package:get/get.dart';

import '../entities/_entities.dart';

abstract class ITrackListService {
  List<Track> get tracks;
  void addTrack(Track track);
  void removeTrack(Track track);
  void addAllTracks(List<Track> tracks);
  void removeAllTracks();
  void clearTracksAdded();

  int get tracksAdded;
  Stream<List<Track>> get trackStream;
}

class TrackListService extends GetxService implements ITrackListService {
  late final StreamController<List<Track>> _controller;

  TrackListService() {
    _controller = StreamController<List<Track>>.broadcast();
  }

  final _tracks = <Track>[];
  int _tracksAdded = 0;

  @override
  List<Track> get tracks => _tracks;

  @override
  int get tracksAdded => _tracksAdded;

  @override
  Stream<List<Track>> get trackStream => _controller.stream;

  @override
  void clearTracksAdded() => _tracksAdded = 0;

  @override
  void addTrack(Track track) {
    _tracks.add(track);
    _tracksAdded++;
    _notifyListeners();
  }

  @override
  void removeTrack(Track track) {
    _tracks.remove(track);
    _notifyListeners();
  }

  @override
  void removeAllTracks() {
    _tracks.clear();
    clearTracksAdded();
    _notifyListeners();
  }

  void _notifyListeners() {
    _controller.add(_tracks);
  }

  @override
  void addAllTracks(List<Track> tracks) {
    for (final track in tracks) {
      addTrack(track);
      _tracksAdded++;
    }
  }
}
