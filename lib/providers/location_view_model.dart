import 'package:flutter/material.dart';
import 'package:weather_api_example/models/location.dart';

class LocationViewModel with ChangeNotifier {
  LocationModel lastLocationData =
      LocationModel(latitude: 41.015137, longitude: 28.979530);

  LocationModel get getCurLocation {
    return lastLocationData;
  }


  void upgradeLocation(double latitude, double longitude) {
    LocationModel thislocation =
        LocationModel(latitude: latitude, longitude: longitude);
    lastLocationData = thislocation;
    notifyListeners();
  }
}
