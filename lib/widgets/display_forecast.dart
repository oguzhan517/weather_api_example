import 'package:flutter/material.dart';
import '../providers/weather_view_model.dart';
import 'three_day_forecast.dart';

class DisplayForecast extends StatelessWidget {
  const DisplayForecast({
    super.key,
    required this.weatherModel,
  });
  final WeatherViewModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        weatherModel.weatherData!.location.name,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.cyan),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Anlık")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${weatherModel.weatherData!.current.windKph} km/sa",
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                        "Rüzgarın açısı ${weatherModel.weatherData!.current.windDegree}"),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Hissedilen ${weatherModel.weatherData!.current.feelslikeC}°C"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sıcaklık ${weatherModel.weatherData!.current.tempC}°C",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // hissedilen ve normal sıcaklık buraya
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Theme.of(context).primaryColorDark,
                  child: Image.network(
                    "https:${weatherModel.weatherData!.current.condition.icon}",
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ThreeDayForecast(
                    foreCast: weatherModel.weatherData!.forecast.forecastday)
              ],
            )),
      ),
    );
  }
}
