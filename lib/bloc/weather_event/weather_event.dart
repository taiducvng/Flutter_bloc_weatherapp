import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object> get props => [];
}

class InitialWeatherEvent extends WeatherEvent {}

@override
class FetchWeatherEvent extends WeatherEvent {
  final String city;
  const FetchWeatherEvent(this.city);

  @override
  List<Object> get props => [city];
}
