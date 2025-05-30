import 'dart:async';
import 'package:flutter/material.dart';

import '../../resources/assets_manger.dart';
import '../../resources/routes_manger.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              AssetsManger.splashLogo,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Text(
            //   AppStringManger.freePalestine,
            //   style: Theme.of(context).textTheme.headlineLarge,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
