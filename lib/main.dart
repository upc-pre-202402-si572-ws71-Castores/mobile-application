import 'package:flutter/material.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TransportApp',
      home: HomeScreenClient(),
      routes: {
        'home-client':    (BuildContext context) => HomeScreenClient(),
        'home-carrier':   (BuildContext context) => HomeScreenCarrier()
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(185, 218, 221, 249)),
        useMaterial3: true,
      ),

    );
  }
}
