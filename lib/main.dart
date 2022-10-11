import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(59.3293, 18.0686);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _teleportRandom() {
    setState(() {
      var random = Random();
      double randomLat = -90 + random.nextDouble() * 90 * 2;
      double randomLng = -180 + random.nextDouble() * 180 * 2;

      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(randomLat, randomLng),
          zoom: 6.0,
        ),
      ));
    });
  }

  void _teleportHome() {
    setState(() {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(59.3293, 18.0686),
          zoom: 12.0,
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map Project'),
          backgroundColor: Colors.orange[700],
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              label: const Text('Teleport me to somewhere random'),
              onPressed: _teleportRandom,
              tooltip: 'Teleport me to somewhere random',
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              label: const Text('Bring me back home'),
              onPressed: _teleportHome,
              tooltip: 'Bring me back home',
            ),
          ),
        ]),
      ),
    );
  }
}
