import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:pharmacies/models/location_service.dart';
import 'package:pharmacies/models/pharmacies.dart';
import 'package:pharmacies/pages/setting_page.dart';
import 'package:pharmacies/utils/connection.dart';

import 'package:shimmer/shimmer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'abut_app.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

class GoogleMapPage2 extends StatefulWidget {
  final List<City> _cities;
  const GoogleMapPage2(this._cities, {Key? key}) : super(key: key);

  @override
  _GoogleMapPage2State createState() => _GoogleMapPage2State();
}

class _GoogleMapPage2State extends State<GoogleMapPage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoubleBack(
        waitForSecondBackPress: 2,
        message: 'messge exit'.tr,
        background: Colors.white,
        backgroundRadius: 13,
        textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        child: HomePageApp(widget._cities),
      ),
    );
  }
}

class HomePageApp extends StatefulWidget {
  final List<City> _cities;
  const HomePageApp(this._cities, {Key? key}) : super(key: key);

  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: GoogleMapLocation(widget._cities),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            logout();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 60),
                child: Shimmer.fromColors(
                  baseColor: Colors.blue,
                  highlightColor: Colors.cyan,
                  child: Text(
                    'SYRIA Pharmacies',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.green,
              height: 10,
            ),
            ListTile(
              title: Text(
                'Settings'.tr,
                style: TextStyle(color: Colors.blue, fontSize: 19),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              onTap: () {
                onTapNavegatorToSetting();
              },
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
                title: Text(
                  'About the app'.tr,
                  style: TextStyle(color: Colors.blue, fontSize: 19),
                ),
                leading: Icon(
                  Icons.app_blocking,
                  color: Colors.green,
                ),
                onTap: () {
                  ontapnave();
                }),
            Divider(
              color: Colors.red,
              height: 10,
            ),
            ListTile(
                title: Text(
                  'exit'.tr,
                  style: TextStyle(color: Colors.blue, fontSize: 19),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
                onTap: () {
                  logout();
                }),
          ],
        ),
      ),
    );
  }

  void ontapnave() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AboutApp();
        },
      ),
    );
  }

  void logout() {
    SystemNavigator.pop();
  }

  void onTapNavegatorToSetting() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SettingPage();
        },
      ),
    );
  }
}

class GoogleMapLocation extends StatefulWidget {
  final List<City> _cities;
  const GoogleMapLocation(this._cities, {Key? key}) : super(key: key);

  @override
  _GoogleMapLocationState createState() => _GoogleMapLocationState();
}

class _GoogleMapLocationState extends State<GoogleMapLocation> {
  Position? currentPosition;
  Set<Marker> _markers = Set();
  var geolocater = Geolocator();
  GoogleMapController? newGoogleMapController;
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      var today = getToday();
      var phs = getDutyPharmacies(widget._cities, today);
      for (var p in phs) {
        print(p.locationPH.longiTude);
        print(p.locationPH.latiTude);
        _markers.add(
          Marker(
              markerId: MarkerId(p.phone!),
              position: LatLng(p.locationPH.latiTude!, p.locationPH.longiTude!),
              infoWindow: InfoWindow(
                title: p.phName,
                snippet: p.phone,
              )),
        );
      }
    });
  }

  void locatePosision() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latilongiposition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latilongiposition, zoom: 6);
    newGoogleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  LocationService _locationService = LocationService();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.8021, 38.9968),
    zoom: 6,
  );
  double _latitude = 0;
  double _langitude = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _locationService.sendLocationToData(context);
    locatePosision();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: _onMapCreated,
        markers: _markers);
  }
}
