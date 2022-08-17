// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';
import 'package:weather_app/model/WeatherData.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends WeatherState {}

class LoadingState extends WeatherState {}

class LoadedState extends WeatherState {
  final weatherData;
  LoadedState(this.weatherData);
  Weather get getWeather => weatherData;
  @override
  List<Object?> get props => [weatherData];
}

class WeatherNotLoadedState extends WeatherState {}
