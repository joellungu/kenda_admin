import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';
import 'package:http/http.dart' as http;

class ApplicationController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  getCourses() async {
    //
    change([], status: RxStatus.success());
  }

  //
  setLogo(int id, Uint8List logo) async {
    var box = GetStorage();
    //
    http.Response response = await http.put(
        Uri.parse("${Requete.url}/companie/logo/$id"),
        body: logo,
        headers: {"Accept": "*/*"});

    //
    //Response rep = await requete.putE("companie/logo/$id", logo);
    //
    if (response.statusCode == 200 || response.statusCode == 201) {
      //
      print("body, 1 ${response.body}");
      Get.back();
      //
      return true;
      //
    } else {
      //
      print("body, 2 ${response.body}");
      print("body, 2 ${response.statusCode}");
      Get.back();
      //
      return false;
    }
  }
  //
}
