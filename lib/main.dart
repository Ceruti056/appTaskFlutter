import 'package:apptask/splash_screen.dart';
import 'package:apptask/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,

      //  theme: MaterialTheme(Typography.blackCupertino).light(),
       darkTheme: MaterialTheme(Typography.blackCupertino).dark(),
    );
  }
}


