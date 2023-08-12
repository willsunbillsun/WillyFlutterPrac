library google_maps_flutter;

import 'dart:async';
import'dart:io';
import 'package:flutter/material.dart';
import 'package:pleasebeadartfile/shared/menu_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.5897741, -122.4065245),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(45.6184, -122.4276), //lacamas lake
      //tilt: 59.440717697143555,
      zoom: 15.151926040649414
  );

  static const CameraPosition _kCHS = CameraPosition(
      target: LatLng(45.6109586, -122.4013907),
      zoom: 16.6
  ); //Camera Position



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MapScreen')),
      drawer: MenuDrawer(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text('Go To Lake'),
              icon: const Icon(Icons.directions_boat),
            ),
            Expanded(child: Container()),
            FloatingActionButton.extended(
              onPressed: _goToCHS,
              label: const Text("Go To CHS"),
              icon: const Icon(Icons.book_outlined),
            ),
          ]
        ),
      )

    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _goToCHS() async{
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kCHS));
  }
}
