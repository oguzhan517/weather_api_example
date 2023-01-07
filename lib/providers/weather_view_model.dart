import 'package:flutter/material.dart';
import 'package:weather_api_example/providers/location_view_model.dart';
import '../models/weather.dart';
import '../service_locator.dart';
import '../services/weather_service.dart';

class WeatherViewModel with ChangeNotifier {
  Weather? weatherData;
  double latitude = 41.015137;
  double longitude = 28.979530;

  WeatherViewModel({required this.latitude, required this.longitude});

  Weather? get getWeatherData {
    return weatherData;
  }

  Future<void> getThisLocationWeather() async {
    Weather locationWeather = await getIt<WeatherService>()
        .getLocationWeatherData(latitude, longitude);
    weatherData = locationWeather;
    notifyListeners();
  }

  void updates(LocationViewModel location) {
    latitude = location.lastLocationData.latitude;
    longitude = location.lastLocationData.longitude;

  }

  

  Future<void> getMyCityWeather(String city) async {
    Weather cityWeather = await getIt<WeatherService>().getCityData(city);
    weatherData = cityWeather;
    notifyListeners();
  }

  Future<void> getYourLocationWeatherData() async {
    Weather yourLocationWeather =
        await getIt<WeatherService>().getYourLocationWeather();
    weatherData = yourLocationWeather;
    notifyListeners();
  }
}
