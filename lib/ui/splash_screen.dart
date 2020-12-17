import 'package:flutter/material.dart';
import 'package:flutter_getx_ex1/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (_) => print('============> normal dispose'),
      init: SplashController(),
      builder: (_) => Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
