import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:suezproduction/controller/MapSampleController.dart';

class MapSample extends StatelessWidget {
  MapSamplecontrollerTmp mycontroller = Get.put(MapSamplecontrollerTmp());
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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
                  Text(placemarkers[0].street.toString(),
                      style: TextStyle(
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
                  ) /*,
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
          Text(mycontroller.branchName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900)),
          Expanded(
              child: GoogleMap(
            markers: mycontroller.markers,
            mapType: MapType.normal,
            initialCameraPosition: mycontroller.kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ))
        ],
      ),
   /*   floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          await controller.animateCamera(
              CameraUpdate.newCameraPosition(mycontroller.kLake));
        },
        label: const Text('Zoom'),
        icon: const Icon(Icons.directions_boat),
      )*/
    );
  }
}
