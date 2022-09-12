import 'dart:convert';

class Album {
  final String? id;
  final String? name;
  final String? externalUrl;
  final String? type;
  final String? cover;
  const Album({
    required this.id,
    required this.name,
    required this.type,
    required this.cover,
    required this.externalUrl,
  });

  Album copyWith({
    String? id,
    String? name,
    String? externalUrl,
    String? type,
    String? cover,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      externalUrl: externalUrl ?? this.externalUrl,
      type: type ?? this.type,
      cover: cover ?? this.cover,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'externalUrl': externalUrl,
      'type': type,
      'albumCover': cover,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      externalUrl:
          map['externalUrl'] != null ? map['externalUrl'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      cover: map['albumCover'] != null ? map['albumCover'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) =>
      Album.fromMap(json.decode(source) as Map<String, dynamic>);
}
