import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:weather_api_example/providers/location_view_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_example/providers/weather_view_model.dart';
import 'package:weather_api_example/widgets/zoom_buttons.dart';

class FlutterMapScreen extends StatefulWidget {
  const FlutterMapScreen({super.key});
  static const routeName = "/fluttermapscreen";

  @override
  State<FlutterMapScreen> createState() => _FlutterMapScreenState();
}

class _FlutterMapScreenState extends State<FlutterMapScreen> {
  MapController mapController = MapController();
  double positionX = 10.0;
  double positionY = 10.0;
  bool initMarker = false;

  @override
  void initState() {
    initMarker = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        ModalRoute.of(context)!.settings.arguments as WeatherViewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harita"),
        actions: [
          IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await weatherProvider.getThisLocationWeather();
                navigator.pop();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Consumer<LocationViewModel>(
        builder: (context, locationView, child) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(locationView.getCurLocation.latitude,
                        locationView.getCurLocation.longitude),
                    zoom: 9,
                    onTap: (tapPosition, point) {
                      final pt1 = mapController.latLngToScreenPoint(point);
                      setState(() {
                        initMarker = true;
                        positionX = pt1!.x.toDouble();
                        positionY = pt1.y.toDouble();
                      });
                      locationView.upgradeLocation(
                          point.latitude, point.longitude);
                      weatherProvider.updates(locationView);
                      mapController.latLngToScreenPoint(point);
                    },
                  ),
                  mapController: mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    const ZoomButtons(),
                  ]),
            ),
            if (initMarker == true)
              Positioned(
                  width: 30,
                  height: 30,
                  top: positionY,
                  left: positionX,
                  child: const Icon(
                    Icons.place,
                    color: Colors.red,
                  )),
          ],
        ),
      ),
    );
  }
}
