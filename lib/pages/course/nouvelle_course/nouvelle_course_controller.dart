import 'dart:convert';

import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class NouvelleCourseController extends GetxController {
  Requete requete = Requete();

  creerCourse(Map e) async {
    //
    Response rep = await requete.postE("courses", e);
    if (rep.isOk) {
      //
      print(rep.statusCode);
      print(rep.body);
    } else {
      print(rep.statusCode);
      print(rep.body);
    }
  }
}
