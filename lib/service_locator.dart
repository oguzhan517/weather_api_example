import 'package:get_it/get_it.dart';
import './services/weather_service.dart';

var getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<WeatherService>(() => WeatherService());
}
