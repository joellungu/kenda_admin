import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'rapport_controller.dart';

class Rapport extends StatelessWidget {
  RxList rapports = RxList();
  RxString date = "".obs;
  //
  RapportController rapportController = Get.find();

  final formKey = GlobalKey<FormState>();
  final titre = TextEditingController();
  final object = TextEditingController();
  final contenue = TextEditingController();

  Rapport() {
    DateTime d = DateTime.now();
    date.value = "${d.day}-${d.month}-${d.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Nouveau rapport",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    //controller: d,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.edit),
                      hintText: '$date'.tr,
                      labelText: '$date'.tr,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: object,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.edit),
                      hintText: 'Objet'.tr,
                      labelText: 'Objet'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Objet'.tr;
                      }

                      return null;
                    },
                    onChanged: (value) {
                      //print("Password value $value");
                    },
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextFormField(
                  //   controller: titre,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     prefixIcon: const Icon(Icons.edit),
                  //     hintText: 'Titre'.tr,
                  //     labelText: 'Titre'.tr,
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'titre'.tr;
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (value) {
                  //     //print("Password value $value");
                  //   },
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: contenue,
                    maxLines: 12,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.person),
                      hintText: 'Contenue'.tr,
                      labelText: 'Contenue'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'contenue'.tr;
                      }

                      return null;
                    },
                    onChanged: (value) {
                      //print("Password value $value");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                DateTime dateTime = DateTime.now();
                print("cool");
                //
                var box = GetStorage();
                //
                Map e = box.read("user");
                Map u = {
                  //"id": 2,
                  "idPartenaire": e['id'],
                  "object": object.text,
                  //"titre": titre.text,
                  "contenue": contenue.text,
                  "date": "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                  "idAgent": "1234567"
                };
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
                bool v = await rapportController.creerRapport(u);
                if (v) {
                  Get.back();
                  Get.snackbar("Succès", "Rapport enregistré");
                } else {
                  Get.back();
                  Get.snackbar("Erreur",
                      "Un problème est survenu lors de l'enregistrement du rapport!");
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 2,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 2,
                ),
                child: Text(
                  "Enregistrer".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.circular(10),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                  // ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
