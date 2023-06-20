// To parse this JSON data, do
//
//     final sehir = sehirFromMap(jsonString);

import 'dart:convert';

class Sehir {
    Sehir({
        this.name,
        this.localNames,
        this.lat,
        this.lon,
        this.country,
    });

    String? name;
    Map<String, String?>? localNames;
    double? lat;
    double? lon;
    String? country;

    factory Sehir.fromJson(String str) => Sehir.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sehir.fromMap(Map<String, dynamic> json) => Sehir(
        name: json["name"],
        localNames: Map.from(json["local_names"]!).map((k, v) => MapEntry<String, String?>(k, v)),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "local_names": Map.from(localNames!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "lat": lat,
        "lon": lon,
        "country": country,
    };
}
