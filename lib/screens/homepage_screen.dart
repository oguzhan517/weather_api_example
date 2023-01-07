import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../widgets/display_forecast.dart';
import 'package:weather_api_example/providers/location_view_model.dart';
import 'package:weather_api_example/providers/weather_view_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_example/screens/flutter_map_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var valueLocation = Provider.of<LocationViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Hava Durumu"),
      ),
      body: ViewModelBuilder<WeatherViewModel>.reactive(
        viewModelBuilder: () => WeatherViewModel(latitude: 10, longitude: 10),
        onModelReady: (weatherModel) async {
          await weatherModel.getYourLocationWeatherData();
          valueLocation.upgradeLocation(weatherModel.weatherData!.location.lat,
              weatherModel.weatherData!.location.lon);
        },
        builder: (context, weatherModel, child) => SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
            child: Column(
              children: [
                TextField(
                  controller: cityController,
                  decoration:
                      const InputDecoration(labelText: "Şehir - Bölge gir"),
                ),
                TextButton.icon(
                    onPressed: () async {
                      await weatherModel.getMyCityWeather(cityController.text);
                      valueLocation.upgradeLocation(
                          weatherModel.weatherData!.location.lat,
                          weatherModel.weatherData!.location.lon);
                    },
                    icon: const Icon(Icons.location_city),
                    label: const Text("Şehir - Bölge hava tahmini")),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(FlutterMapScreen.routeName, arguments: weatherModel);
                    },
                    icon: const Icon(Icons.map),
                    label: const Text("Haritadan seçim yap")),
                if(weatherModel.weatherData != null)
                DisplayForecast(weatherModel: weatherModel)
              ],
            ),
          )),
        ),
      ),
    );
  }
}
