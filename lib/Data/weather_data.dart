import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meteo_app/Classes/openweather.dart';

class Meteos with ChangeNotifier {
  List<OpenWeather> _data = [];

  List<OpenWeather> get data {
    return [..._data];
  }

  Future<void> fetchData() async {
    try {
      const url =
          "http://api.openweathermap.org/data/2.5/find?lat=55.5&lon=37.5&cnt=10&appid=806efce618f35913fb9426a0e3bfff54";
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      var data = extractedData["list"] as List;
      var list =
          data.map<OpenWeather>((json) => OpenWeather.fromJson(json)).toList();
      _data = list;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
