import 'package:flutter/material.dart';
import 'package:transport_app_mobile/features/serviceManagement/screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TransportApp',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(185, 218, 221, 249)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
