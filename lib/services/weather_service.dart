import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/weather.dart';
import 'package:location/location.dart' as lc;
import '../models/location.dart';

class WeatherService {
  var client = http.Client();
  Future<Weather> getLocationWeatherData(double lat, double lng) async {
    Weather locationWeather;
    final currentLocationUrl = Uri.parse(
        "https://weatherapi-com.p.rapidapi.com/forecast.json?q=$lat,$lng&days=3&lang=tr");
    final response = await client.get(currentLocationUrl, headers: {
      "X-RapidAPI-Key": Constants.weatherApiKey,
      'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
    });
    locationWeather = Weather.fromJson(jsonDecode(response.body));
    return locationWeather;
  }

  Future<Weather> getCityData(String cityName) async {
    Weather cityWeather;
    final currentLocationUrl = Uri.parse(
        "https://weatherapi-com.p.rapidapi.com/forecast.json?q=$cityName&days=3&lang=tr");
    final response = await client.get(currentLocationUrl, headers: {
      "X-RapidAPI-Key": Constants.weatherApiKey,
      'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
    });
    cityWeather = Weather.fromJson(jsonDecode(response.body));
    return cityWeather;
  }

  Future<Weather> getYourLocationWeather() async {
    final location = lc.Location();
    var data = await location.getLocation();
    LocationModel yourCurrentLocation = LocationModel(
        latitude: data.latitude as double, longitude: data.longitude as double);
    Weather yourLocationWeather;
    final yourcurrentLocationUrl = Uri.parse(
        "https://weatherapi-com.p.rapidapi.com/forecast.json?q=${yourCurrentLocation.latitude},${yourCurrentLocation.longitude}&days=3&lang=tr");
    final response = await client.get(yourcurrentLocationUrl, headers: {
      "X-RapidAPI-Key": Constants.weatherApiKey,
      'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
    });
    yourLocationWeather = Weather.fromJson(jsonDecode(response.body));
    return yourLocationWeather;
  }
}
