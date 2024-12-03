import 'package:weather_app/Models/WeatherModel.dart';

class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final Weathermodel weathermodel;

  WeatherLoadedState({required this.weathermodel});
}

class WeatherFailureState extends WeatherStates {}
