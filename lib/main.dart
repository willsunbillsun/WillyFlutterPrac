import 'package:flutter/material.dart';
import 'screens/Screen1.dart';
import 'screens/map_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => Screen1(),
        '/Map': (context) => MapScreen(),
      },
      initialRoute: '/',
    );
  }
}
