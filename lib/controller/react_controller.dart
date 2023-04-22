import 'package:get/get.dart';

class ReactController extends GetxController {
  RxInt counter = 0.obs;

  void increase() {
    counter++;
  }
}