// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:weather_app/model/WeatherData.dart';
import 'dart:convert';

class FetchWeather {
  Future<WeatherData?> getWeather(String query) async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=704139945b46734a7d4d7ed879694738');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        var data = WeatherData.fromJson(decoded);
        return data;
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
