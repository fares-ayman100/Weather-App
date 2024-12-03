class Weathermodel {
  final String cityName;
  final double temp;
  final double minTem;
  final double maxTem;
  final DateTime date;
  final String? image;
  final String weatherState;

  Weathermodel(
      {required this.cityName,
      required this.temp,
      required this.date,
      this.image,
      required this.maxTem,
      required this.minTem,
      required this.weatherState});
  factory Weathermodel.WeatherModel(json) {
    return Weathermodel(
        cityName: json['location']['name'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        date: DateTime.parse(json['current']['last_updated']),
        maxTem: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTem: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherState: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
