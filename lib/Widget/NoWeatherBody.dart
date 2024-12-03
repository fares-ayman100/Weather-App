import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is No Weather 😔 Start',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          Text(
            'Searching Now 🔍',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
        ],
      ),
    );
  }
}
