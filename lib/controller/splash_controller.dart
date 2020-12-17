import 'package:flutter_getx_ex1/ui/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () => Get.off(
          MyHomePage(
            title: "GetX",
          ),
          transition: Transition.zoom),
    );
    print('==========> onReady SplashController');
  }

}
