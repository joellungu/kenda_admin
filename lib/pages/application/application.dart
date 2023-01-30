import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/application/application_controller.dart';

import '../accueil/accueil.dart';

class Application extends GetView<ApplicationController> {
  Application() {
    controller.getCourses();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Status bar color
      child: Scaffold(
        body: controller.obx(
          (state) => Accueil(),
          onLoading: Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          ),
          onError: (e) {
            return Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Erreur du à $e"),
                    ElevatedButton(
                      onPressed: () {
                        //
                        //Get.to(Recherche());
                        //
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: Get.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Valider",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          onEmpty: Center(
              child: SizedBox(
            height: 100,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Vide"),
                ElevatedButton(
                  onPressed: () {
                    //
                    //Get.to(Recherche());
                    //
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blue,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: Get.size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
