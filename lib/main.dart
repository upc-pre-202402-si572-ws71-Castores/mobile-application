import 'package:flutter/material.dart';
import 'package:transport_app_mobile/features/iam/screens/login_screen.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TransportApp',
      routes: {
        'home-client':    (BuildContext context) => HomeScreenClient(),
        'home-carrier':   (BuildContext context) => HomeScreenCarrier()
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(185, 218, 221, 249)),
        useMaterial3: true,
      ),
      home: LoginScreen(),

    );
  }
}
