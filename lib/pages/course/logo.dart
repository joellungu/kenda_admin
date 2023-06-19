import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kenda_admin/pages/application/application_controller.dart';
import 'package:kenda_admin/utils/requetes.dart';

class Logo extends StatelessWidget {
  //
  //
  Requete requete = Requete();
  //
  RxString path = "".obs;
  //
  ApplicationController applicationController = Get.find();
  //
  Logo() {
    //
    e.value = box.read("user") ?? {};
    //print("::::: ${e.value}");
  }
  //
  var box = GetStorage();
  //
  RxMap e = {}.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //
        final ImagePicker picker = ImagePicker();
        //
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        //setState(() {
        if (image != null) {
          Get.dialog(
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          );
          path.value = image.path;
          e['logo'] = File(path.value).readAsBytesSync();
          //
          bool v = await applicationController.setLogo(e);
          if (v) {
            //
            path.value = "";
            //
          }
        }
        //});
      },
      child: Obx(
        () {
          if (path.value.isEmpty) {
            if (e['logo'] != null) {
              return Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Requete.url}/partenaires/profil.png?id=${e['idPartenaire']}"),
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              );
            } else {
              return Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
              );
            }
          } else {
            return Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              //child: const Icon(Icons.photo_camera),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(
                      File(path.value),
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          }
        },
      ),
    );
  }
}
