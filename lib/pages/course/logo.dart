import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 500,
          maxWidth: 500,
          imageQuality: 85,
        );
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
          //e['logo'] = "";
          path.value = image.path;
          Uint8List p = await image.readAsBytes();
          var ph = File(path.value).readAsBytesSync();
          //
          bool v = await applicationController.setLogo(e["idPartenaire"], p);
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
          return SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
              "${Requete.url}/companie/profil.png?id=${e['idPartenaire']}",
              loadingBuilder: (context, child, loadingProgress) =>
                  (loadingProgress == null)
                      ? child
                      : CircularProgressIndicator(),
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
          );
          // child: FutureBuilder(
          //   future: getPhoto(
          //     "companie/profil.png?id=${e['idPartenaire']}",
          //   ),
          //   builder: (c, t) {
          //     if (t.hasData) {
          //       var v = t.data as bool;
          //       //
          //       //
          //       if (v) {
          //         return Image.network(
          //           "${Requete.url}/companie/profil.png?id=${e['idPartenaire']}",
          //           loadingBuilder: (context, child, loadingProgress) =>
          //               (loadingProgress == null)
          //                   ? child
          //                   : CircularProgressIndicator(),
          //           errorBuilder: (context, error, stackTrace) =>
          //               Icon(Icons.error),
          //         );
          //       } else {
          //         return Container(
          //           alignment: Alignment.center,
          //           child: const Icon(Icons.photo_camera),
          //         );
          //       }
          //     } else {
          //       return Container(
          //         alignment: Alignment.center,
          //         child: const Icon(
          //           Icons.photo_camera,
          //           color: Colors.red,
          //         ),
          //       );
          //     }
          //   },
          // )
          // // CachedNetworkImage(
          // //   imageUrl: "",
          // //   placeholder: (context, url) => CircularProgressIndicator(),
          // //   errorWidget: (context, url, error) => Icon(
          // //     Icons.photo_camera_front,
          // //   ),
          // // ),
          // // decoration: BoxDecoration(
          // //   image: DecorationImage(
          // //     image: NetworkImage(
          // //         ""),
          // //   ),
          // //   borderRadius: BorderRadius.circular(25),
          // // ),
          // );
        },
      ),
    );
  }

  Future<bool> getPhoto(String url) async {
    //
    Requete requete = Requete();
    //
    print('satutcode: $url');
    //
    Response response = await requete.getE(url);
    if (response.isOk) {
      //
      print("satutcode: ${response.statusCode}");
      return true;
    } else {
      //
      print("satutcode: ${response.statusCode}");
      return false;
    }
  }
}
