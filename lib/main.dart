import 'package:flutter/material.dart';
import 'package:weather_api_example/screens/flutter_map_screen.dart';
import 'package:weather_api_example/screens/homepage_screen.dart';
import 'service_locator.dart';
import 'package:provider/provider.dart';
import 'providers/location_view_model.dart';
import 'providers/weather_view_model.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationViewModel()),
        ChangeNotifierProxyProvider<LocationViewModel, WeatherViewModel>(
            create: (_) => WeatherViewModel(latitude: 0.0, longitude: 0.0),
            update: (_, value, previous) => previous!..updates(value))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePageScreen(),
        routes: {
          FlutterMapScreen.routeName: (context) => const FlutterMapScreen()
        },
      ),
    );
  }
}
