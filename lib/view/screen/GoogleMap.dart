import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.051490, 31.208620),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.051490, 31.208620),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Set<Marker> _markers = Set();
  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(30.051490, 31.208620),
        onTap: () {
          // Handle marker tap
          _onMarkerTapped(LatLng(30.051490, 31.208620), this.context);
        }));
  }

  void _onMarkerTapped(LatLng position, BuildContext context) async {
    // Fetch place details using Google Places API
    List<Placemark> placemarkers =
        await placemarkFromCoordinates(30.051490, 31.208620);
    placemarkers[0].country;
    placemarkers[0].street;
    placemarkers[0].postalCode;
    placemarkers[0].administrativeArea;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 16.0),
              Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 60,
                  ),
                  Text("المركز الرئيسي",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900)),
                  Text(placemarkers[0].street.toString(),style: TextStyle(

                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900)),
                  Row(
                    children: [
                      Text(" الرقم البريدي ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900)),
                      Text(placemarkers[0].postalCode.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900)),
                    ],
                  )/*,
                  Text(placemarkers[0].administrativeArea.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900))*/
                ],
              ),
              // يمكنك إضافة عناصر واجهة مستخدم أخرى هنا
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('إغلاق'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("المركز الرئيسي",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          Expanded(
              child: GoogleMap(
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Zoom'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _MakerInfo(Context context) async {}
}
