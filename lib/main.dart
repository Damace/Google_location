import 'package:flutter/material.dart';
import 'package:vms/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 30, 97, 203)),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
