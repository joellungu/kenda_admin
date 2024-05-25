import 'dart:convert';

import 'package:get/get.dart';
import 'package:kenda_admin/pages/accueil/accueil.dart';
import 'package:kenda_admin/pages/accueil/accueil_admin.dart';
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

      Get.back();
      Get.snackbar("Horaire", "Votre horaire a bien été enregistré");
      Get.offAll(AccueilAdmin());
    } else {
      print(rep.statusCode);
      print(rep.body);
      Get.back();
      Get.snackbar("Horaire",
          "Un problème est survenu lors de l'enregistrement code: ${rep.statusCode}");
    }
  }
}
