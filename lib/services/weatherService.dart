import 'dart:convert';

import 'package:bored_api/data/models/WeatherModel.dart';
import 'package:http/http.dart' as http;

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(jsonDecode(str));

String weatherModelToJson(WeatherModel data) => jsonEncode(data.toJson());

class WeatherService {
  Future<WeatherModel> getWeather() async {
    await Future<void>.delayed(Duration(seconds: 1));
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Danang&appid=704139945b46734a7d4d7ed879694738'));
    // a thay q =tên city appid = cái appid của tài khoản(api này đòi phải có session trước mới cho get về)
    final temperature = weatherModelFromJson(response.body);
    return temperature;
  }
}
