import 'dart:convert';

class Card{

  Card({
    required this.name,
    required this.messaje,
    this.photoUrl,
  });

  String name;
  String messaje;
  String? photoUrl;

  factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Card.fromMap(Map<String, String> json) => Card(
    name: json["name"] as String,
    messaje: json["messaje"] as String,
    photoUrl: json["photoUrl"],
  );

  Map<String, String> toMap() => {
    "name" : name,
    "messaje" : messaje,
    "photoUrl" : photoUrl as String,
  };

}