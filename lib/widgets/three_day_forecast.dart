import 'package:flutter/material.dart';
import 'package:weather_api_example/models/weather.dart';
import 'package:weather_api_example/widgets/one_day_forecast.dart';

class ThreeDayForecast extends StatelessWidget {
  const ThreeDayForecast({super.key, required this.foreCast});
  final List<ForeCastDay> foreCast;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: foreCast.map((e) => OneDayForecast(day: e)).toList());
  }
}
