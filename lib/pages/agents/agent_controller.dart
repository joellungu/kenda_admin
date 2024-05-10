import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class AgentController extends GetxController with StateMixin<List> {
  Requete requete = Requete();
  load(int id) async {
    Response rep = await requete.getE(
      "agent/all/$id",
    );
    if (rep.isOk) {
      //
      print("La data: ${rep.body}");
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
  }

  enregistrement(Map e) async {
    Response rep = await requete.postE("agent", e);
    if (rep.isOk) {
      Get.back();
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

  putDataAgent(Map e) async {
    Response rep = await requete.putE("agents/${e['id']}", e);
    if (rep.isOk) {
      //

      Get.back();
      Get.back();
      Get.snackbar("Succès", "Mise à jour reussi.");
    } else {
      //
      Get.back();
      Get.snackbar("Erreur", "Mise à jour non abouti.");
    }
  }

  putDataAdmin(Map e) async {
    Response rep = await requete.putE("companie/${e['id']}", e);
    if (rep.isOk) {
      //
      Get.snackbar("Succès", "Mise à jour reussi.");
      Get.back();
      Get.back();
    } else {
      //
      Get.snackbar("Erreur", "Mise à jour non abouti.");
      Get.back();
    }
  }
}
