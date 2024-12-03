import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubit/get_Current_Weather_Cubit/get_weather_state.dart';
import 'package:weather_app/Views/SearchView.dart';
import 'package:weather_app/Widget/NoWeatherBody.dart';
import 'package:weather_app/Widget/WeatherInfoBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }),
              );
            },
            icon: const Icon(Icons.search),
            iconSize: 35,
            color: Colors.white,
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState)
            return WeatherInfoBody(
              weathermodel: state.weathermodel,
            );
          else
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Opps ,There Was An Error 😑',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text('Try Search.', style: TextStyle(fontSize: 25))
                ],
              ),
            );
        },
      ),
    );
  }
}
