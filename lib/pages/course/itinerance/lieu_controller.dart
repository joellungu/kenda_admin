import 'dart:async';

import 'package:get/get.dart';

class LieuController extends GetxController with StateMixin<List> {
  RxString depart = "".obs;
  RxString arrive = "".obs;
  RxList historique = RxList();
  //

  getAllBusTranson(String lieu) async {
    Timer(Duration(seconds: 3), () {
      change([
        {"id": "1234567890"}
      ], status: RxStatus.success());
    });
  }
}
