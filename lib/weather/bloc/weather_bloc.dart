import 'package:bloc/bloc.dart' show Bloc;
import 'package:bored_api/data/models/WeatherModel.dart';
import 'package:bored_api/services/weatherService.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherState get initialState => WeatherInitialState();

  final WeatherService _weatherService;

  WeatherBloc(this._weatherService) : super(WeatherLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final temperatura = await _weatherService.getWeather();
      emit(WeatherLoadedState(temperatura));
    });
  }
}
