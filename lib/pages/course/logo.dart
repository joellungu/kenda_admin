import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kenda_admin/utils/requetes.dart';

class Logo extends StatelessWidget {
  //
  Requete requete = Requete();
  //
  RxString path = "".obs;
  //
  Logo() {
    //
    e.value = box.read("user") ?? {};
    print("::::: ${e.value}");
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
          path.value = image.path;
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
