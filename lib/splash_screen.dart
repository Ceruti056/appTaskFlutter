import 'dart:async';
import 'package:apptask/home_screen.dart';
import 'package:apptask/login_screen.dart';
import 'package:apptask/user.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({super.key,  this.user});

  final Users? user;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/checkup.png',
            fit: BoxFit.fill,
          ),
        ],
      )),
    );
  }
}