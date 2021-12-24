import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  sendLocationToData(context) async {
    Location location = new Location();
    bool _serviceEnnable;
    PermissionStatus _permassionGranted;
    LocationData _locationData;

    _serviceEnnable = await location.serviceEnabled();
    if (!_serviceEnnable) {
      _serviceEnnable = await location.requestService();
      if (_serviceEnnable) {
        return;
      }
    }
    _permassionGranted = await location.hasPermission();
    if (_permassionGranted == PermissionStatus.denied) {
      _permassionGranted = await location.requestPermission();
      if (_permassionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
}
