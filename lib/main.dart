import 'dart:io';

import 'package:apptask/splash_screen.dart';
import 'package:apptask/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
    if (kIsWeb) {
    // Não faz nada de especial para web
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Inicializa o sqflite_common_ffi para desktop
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,

      //  theme: MaterialTheme(Typography.blackCupertino).light(),
      darkTheme: const MaterialTheme(Typography.blackCupertino).dark(),
    );
  }
}
