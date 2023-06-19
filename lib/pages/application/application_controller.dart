import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';

class ApplicationController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  getCourses() async {
    //
    change([], status: RxStatus.success());
  }

  //
  setLogo(Map e) async {
    var box = GetStorage();

    //
    Response rep = await requete.putE("partenaires", e);
    //
    if (rep.isOk) {
      //
      Get.back();
      //
      box.write("user", rep.body);
      return true;
      //
    } else {
      //
      Get.back();
      //
      return false;
    }
  }
  //
}
