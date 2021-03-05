import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _myLocation =
      CameraPosition(target: LatLng(0.0, 0.0), zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
