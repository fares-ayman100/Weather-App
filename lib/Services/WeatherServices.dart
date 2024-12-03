import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class Weatherservices {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '08607880d38a4b1982c151144243011';

  final Dio dio;
  Weatherservices({required this.dio});
  Future<Weathermodel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      Weathermodel weathermodel = Weathermodel.WeatherModel(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Opps, There Was An Error , Try Later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        const Column(
          children: [
            Text('Opps, There Was An Error 😑'),
            Text('Try Later'),
          ],
        ),
      );
    }
  }
}
