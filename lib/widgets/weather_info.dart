import 'package:flutter/material.dart';
import 'package:weather_app/model/WeatherData.dart';

class StyleText {
  static const style1 =
      TextStyle(fontSize: 18, height: 1, fontFamily: 'FairDisplay');
  static const style2 =
      TextStyle(fontSize: 25, height: 2, fontFamily: 'FairDisplay');
}

class WeatherInfo extends StatelessWidget {
  final WeatherData weatherInfo;

  const WeatherInfo({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    " City: ${weatherInfo.name}",
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FairDisplay'),
                  ),
                  Text("Status:${weatherInfo.weather[0].description}",
                      style: StyleText.style1)
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              Column(
                children: [
                  Text(
                    "${weatherInfo.main.feelsLike}  độ F",
                    style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FairDisplay'),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FairDisplay'),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.white,
                    indent: 60,
                    endIndent: 60,
                  ),
                  Text(
                    "Humidity: ${weatherInfo.main.humidity}",
                    style: StyleText.style1,
                  ),
                  Text(
                    "Clouds: ${weatherInfo.clouds}",
                    style: StyleText.style1,
                  ),
                  Text(
                    "Wind: ${weatherInfo.wind} ",
                    style: StyleText.style1,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
