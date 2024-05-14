import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';

class BusController extends GetxController with StateMixin<List> {
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  load(int id) async {
    Response rep = await requete.getE(
      "bus/all/$id",
    );
    if (rep.isOk) {
      //
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  enregistrement(Map e) async {
    Response rep = await requete.postE("bus", e);
    if (rep.isOk) {
      Get.back();
      Get.back();
      //
      load(e['idPartenaire']);
      //
      Get.snackbar(
        "Succès",
        "Enregistrement éffectué",
      );
    } else {
      //
      Get.back();
      Get.snackbar(
        "Erreur",
        "Enregistrement non éffectué code: ${rep.statusCode}",
      );
    }
  }

  supprimer(String id) async {
    Response rep = await requete.deleteE(
      "agent/$id",
    );
    if (rep.isOk) {
      Get.back();
      Get.back();
      load(1);
      //
      Get.snackbar(
        "Succès",
        "Suppression éffectué",
      );
    } else {
      //
      Get.back();
      Get.snackbar(
        "Erreur",
        "Suppression non éffectué code: ${rep.statusCode}",
      );
    }
  }

  mettreAjour(Map x) async {
    Response rep = await requete.putE("bus/${x['id']}", x);
    if (rep.isOk) {
      Get.back();
      //
      Get.snackbar(
        "Succès",
        "Photo modifié",
      );
      //
      Map e = box.read("user");
      load(e['id']);
      //
    } else {
      //
      Get.back();
      Get.snackbar(
        "Erreur",
        "Modification non éffectué code: ${rep.statusCode}",
      );
    }
  }
}
