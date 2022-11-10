import 'dart:developer';

import 'package:flutter/material.dart';
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
  void clearTracksAdded();
  int get tracksAdded;
}

class TrackListService extends GetxService implements ITrackListService {
  TrackListService._internal();

  static final TrackListService _instance = TrackListService._internal();

  factory TrackListService() {
    return _instance;
  }
  final _tracks = <Track>[];
  final _listeners = <TrackListListener>[];
  int _tracksAdded = 0;

  @override
  List<Track> get tracks => _tracks;

  @override
  void addTrack(Track track) {
    debugPrint("addTrack listeners length ${_listeners.length}");
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

  @override
  void addListener(TrackListListener listener) {
    _listeners.add(listener);
    debugPrint("addListener listeners length ${_listeners.length}");
  }

  @override
  void removeListener(TrackListListener listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    debugPrint("_notifyListeners listeners length ${_listeners.length}");
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
      _tracksAdded++;
    }
  }

  @override
  void clearTracksAdded() => _tracksAdded = 0;

  @override
  int get tracksAdded => _tracksAdded;
}
