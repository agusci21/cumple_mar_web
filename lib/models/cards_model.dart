import 'dart:convert';

class Cards{

  Cards({
    required this.name,
    required this.messaje,
    this.photoUrl,
    this.id,
  });

  String name;
  String messaje;
  String? photoUrl;
  String? id;

  factory Cards.fromJson(String str) => Cards.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cards.fromMap(Map<String, String> json) => Cards(
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