import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class ZoomButtons extends StatelessWidget {
  const ZoomButtons({super.key});
  final FitBoundsOptions options =
      const FitBoundsOptions(padding: EdgeInsets.all(12));
  @override
  Widget build(BuildContext context) {
    final map = FlutterMapState.maybeOf(context)!;
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
            child: FloatingActionButton(
              heroTag: 'zoomInButton',
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                final bounds = map.bounds;
                final centerZoom = map.getBoundsCenterZoom(bounds, options);
                var zoom = centerZoom.zoom + 1;
                if (zoom > 18) {
                  zoom = 18;
                }
                map.move(centerZoom.center, zoom,
                    source: MapEventSource.custom);
              },
              child: Icon(Icons.zoom_in, color: IconTheme.of(context).color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: FloatingActionButton(
              heroTag: 'zoomOutButton',
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                final bounds = map.bounds;
                final centerZoom = map.getBoundsCenterZoom(bounds, options);
                var zoom = centerZoom.zoom - 1;
                if (zoom < 3) {
                  zoom = 3;
                }
                map.move(centerZoom.center, zoom,
                    source: MapEventSource.custom);
              },
              child: Icon(Icons.zoom_out, color: IconTheme.of(context).color),
            ),
          ),
        ],
      ),
    );
  }
}
