import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_state.dart';
import 'package:weather_app/Views/HomeView.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weathermodel
                        ?.weatherState),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light drizzle':
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
    case 'Patchy light sleet':
    case 'Light sleet':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet':
      return Colors.blueGrey;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.blueGrey;
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.indigo;
    case 'Light sleet showers':
      return Colors.blueGrey;
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.blueGrey;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
// Create State
// Create Cubit
// Create Function
// Provide Cubit
// Integrate Cubit
// Trigger Cubit
