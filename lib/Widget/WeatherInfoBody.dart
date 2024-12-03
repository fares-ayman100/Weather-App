import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weathermodel,
  });
  final Weathermodel weathermodel;

  @override
  Widget build(BuildContext context) {
    Weathermodel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;

    String formattedTime = DateFormat('hh:mm a').format(weathermodel.date);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weathermodel.weatherState),
          getThemeColor(weathermodel.weatherState)[300]!,
          getThemeColor(weathermodel.weatherState)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Text(
              'Updated at $formattedTime',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weathermodel.image}',
                ),
                Text(
                  weathermodel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weathermodel.maxTem.round()}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weathermodel.minTem.round()}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel.weatherState,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
