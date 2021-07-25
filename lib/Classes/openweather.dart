import 'package:flutter/material.dart';

class OpenWeather with ChangeNotifier {
  final int id;
  final String name;
  final Coord coord;
  final Wind wind;
  OpenWeather({
    required this.id,
    required this.name,
    required this.coord,
    required this.wind,
  });

  factory OpenWeather.fromJson(Map<String, dynamic> json) {
    return OpenWeather(
      id: json["id"],
      name: json["name"],
      coord: Coord.fromJson(json["coord"]),
      wind: Wind.fromJson(json["wind"]),
    );
  }
}

class Coord with ChangeNotifier {
  final double lon;
  final double lat;
  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json["lon"],
      lat: json["lat"],
    );
  }
}

class Wind with ChangeNotifier {
  final int deg;
  final double speed;
  Wind({required this.deg, required this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    double value = 0.0;
    if (json["speed"] is int) {
      num x = json["speed"];
      value = x.roundToDouble();
    } else {
      value = json["speed"];
    }

    return Wind(
      deg: json['deg'],
      speed: value,
    );
  }
}
