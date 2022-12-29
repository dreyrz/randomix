import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'album.dart';
import 'artist.dart';

class Track extends Equatable {
  final String? id;
  final String? name;
  final String? type;
  final String? externalUrl;
  final String? previewUrl;
  final DateTime? date;
  final Album? album;
  final List<Artist>? artists;
  final String? genre;

  const Track({
    required this.id,
    required this.name,
    required this.type,
    required this.externalUrl,
    required this.previewUrl,
    required this.date,
    required this.album,
    required this.artists,
    required this.genre,
  });

  Track copyWith({
    String? id,
    String? name,
    String? type,
    String? externalUrl,
    String? previewUrl,
    DateTime? date,
    Album? album,
    List<Artist>? artists,
    String? genre,
  }) {
    return Track(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      externalUrl: externalUrl ?? this.externalUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      date: date ?? this.date,
      album: album ?? this.album,
      artists: artists ?? this.artists,
      genre: genre ?? this.genre,
    );
  }

  bool get isInvalid =>
      id == null ||
      name == null ||
      type == null ||
      externalUrl == null ||
      album == null ||
      artists == null;

  String get artistsName => artists!
      .map((a) => a.name)
      .toString()
      .replaceAll("(", "")
      .replaceAll(")", "");

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() {
    return 'Track name: $name';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'externalUrl': externalUrl,
      'previewUrl': previewUrl,
      'date': date?.millisecondsSinceEpoch,
      'album': album?.toMap(),
      'artists': artists?.map((x) => x.toMap()).toList(),
      'genre': genre,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      genre: map['genre'] != null ? map['genre'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      externalUrl:
          map['externalUrl'] != null ? map['externalUrl'] as String : null,
      previewUrl:
          map['previewUrl'] != null ? map['previewUrl'] as String : null,
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      album: map['album'] != null
          ? Album.fromMap(map['album'] as Map<String, dynamic>)
          : null,
      artists: map['artists'] != null
          ? List<Artist>.from(
              (map['artists']).map<Artist?>(
                (x) => Artist.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) =>
      Track.fromMap(json.decode(source) as Map<String, dynamic>);
}
