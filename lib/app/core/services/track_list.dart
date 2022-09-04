import 'dart:developer';

import 'package:get/get.dart';

import '../entities/_entities.dart';

typedef TrackListListener = void Function();

abstract class ITrackListService {
  List<Track> get tracks;
  void addTrack(Track track);
  void removeTrack(Track track);
  void addAllTracks(List<Track> tracks);
  void removeAllTracks();
  void addListener(TrackListListener listener);
  void removeListener(TrackListListener listener);
}

class TrackListService extends GetxService implements ITrackListService {
  final _tracks = <Track>[];
  final _listeners = <TrackListListener>[];
  @override
  List<Track> get tracks => _tracks;

  @override
  void addTrack(Track track) {
    _tracks.add(track);
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
    _notifyListeners();
  }

  @override
  void addListener(TrackListListener listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(TrackListListener listener) {
    _listeners.remove(listener);
  }

  _notifyListeners() {
    for (final l in _listeners) {
      try {
        l.call();
      } catch (e) {
        log(e.toString(), name: 'TrackListSerive _callListeners');
      }
    }
  }

  @override
  void addAllTracks(List<Track> tracks) {
    for (final track in tracks) {
      addTrack(track);
    }
  }
}
