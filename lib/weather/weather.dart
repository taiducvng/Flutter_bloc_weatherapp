import 'package:bored_api/data/models/WeatherModel.dart';
import 'package:bored_api/services/weatherService.dart';
import 'package:bored_api/weather/bloc/weather_bloc.dart';
import 'package:bored_api/weather/widgets/city_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(
          RepositoryProvider.of<WeatherService>(context),
        )..add(LoadApiEvent()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return _buildInitialInput();
            } else if (state is WeatherLoadingState) {
              return _buildLoadingState();
            } else if (state is WeatherLoadedState) {
              return _buildLoadedWidgetWeatherState(
                  context, state.weatherModel);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildInitialInput() {
    return const Center(
      child: CityInputField(),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedWidgetWeatherState(
      BuildContext context, WeatherModel weatherModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Image.asset('assets/city.jpg'),
                title: Text('City:${weatherModel.name} '),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/cloudy.png'),
                title: Text("Status: ${weatherModel.weather[0].description}"),
                subtitle: Text("Weather id: ${weatherModel.weather[0].id}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/temps.png'),
                title: Text("Temperature: ${weatherModel.main.temp}"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Temperature Max: ${weatherModel.main.tempMax}"),
                dense: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: const FlutterLogo(size: 56.0),
                title: Text("Coordinator: ${weatherModel.coord.lat}"),
                subtitle: Text("Coordinator: ${weatherModel.coord.lon}"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: const FlutterLogo(size: 56.0),
                title: Text("Loacted at: ${weatherModel.sys.country}"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 72.0),
                title: CityInputField(),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
