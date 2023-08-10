import 'package:flutter/material.dart';
import 'package:pleasebeadartfile/shared/menu_drawer.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MapScreen')),
      drawer: MenuDrawer(),
      body: Center(child: FlutterLogo()),
    );
  }
}
