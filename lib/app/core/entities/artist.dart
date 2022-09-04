import 'dart:convert';

class Artist {
  final String id;
  final String name;
  final String externalUrl;
  final String type;

  const Artist({
    required this.id,
    required this.name,
    required this.type,
    required this.externalUrl,
  });

  Artist copyWith({
    String? id,
    String? name,
    String? externalUrl,
    String? type,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      externalUrl: externalUrl ?? this.externalUrl,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'externalUrl': externalUrl,
      'type': type,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      id: map['id'] as String,
      name: map['name'] as String,
      externalUrl: map['externalUrl'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) =>
      Artist.fromMap(json.decode(source) as Map<String, dynamic>);
}
