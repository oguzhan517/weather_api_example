import 'package:flutter/material.dart';
import 'package:weather_api_example/models/weather.dart';

class OneDayForecast extends StatelessWidget {
  const OneDayForecast({super.key, required this.day});
  final ForeCastDay day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day.date.toString()),
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
          child: Column(
            children: [
              Text("max: ${day.day.maxTempC}°C", style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 4,
              ),
              Text("min: ${day.day.minTempC}°C"),
              const SizedBox(
                height: 7,
              ),
              Text("Rüzgar: ${day.day.maxWindKph}"),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 7,
              ),
              Text("Yağış ${day.day.chanceOfRain}"),
              const SizedBox(
                height: 5,
              ),
              Image.network("https:${day.day.condition.icon}"),
            ],
          ),
        ),
      ],
    );
  }
}
