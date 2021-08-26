// To parse this JSON data, do
//
//     final cumpleMarDefaultRtdbExport1 = cumpleMarDefaultRtdbExport1FromMap(jsonString);

import 'dart:convert';

class CumpleMarDefaultRtdbExport1 {
    CumpleMarDefaultRtdbExport1({
        required this.card,
    });

    Card card;

    factory CumpleMarDefaultRtdbExport1.fromJson(String str) => CumpleMarDefaultRtdbExport1.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CumpleMarDefaultRtdbExport1.fromMap(Map<String, dynamic> json) => CumpleMarDefaultRtdbExport1(
        card: Card.fromMap(json["card"]),
    );

    Map<String, dynamic> toMap() => {
        "card": card.toMap(),
    };
}

class Card {
    Card({
        required this.mesage,
        required this.name,
        this.photoUrl,
    });

    String mesage;
    String name;
    String? photoUrl;

    factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Card.fromMap(Map<String, dynamic> json) => Card(
        mesage: json["mesage"],
        name: json["name"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toMap() => {
        "mesage": mesage,
        "name": name,
        "photoUrl": photoUrl,
    };
}
