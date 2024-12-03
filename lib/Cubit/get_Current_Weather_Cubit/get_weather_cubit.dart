import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_state.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Services/WeatherServices.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherInitialState());
  Weathermodel? weathermodel;
  getWeather({required String cityName}) async {
    try {
      weathermodel = (await Weatherservices(dio: Dio())
          .getCurrentWeather(cityName: cityName))!;
      emit(WeatherLoadedState(weathermodel: weathermodel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
