import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_controller.dart';

class FormulaireAgent extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final postnom = TextEditingController();
  final prenom = TextEditingController();
  final telephone = TextEditingController();
  final email = TextEditingController();
  final adresse = TextEditingController();
  var pays = "CD";
  var codePays = "+243";
  RxInt c = 1.obs;
  //
  AgentController agentController = Get.find();
  //
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
            centerTitle: false,
            title: const Text(
              "Nouvel agent",
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
                  TextFormField(
                    controller: nom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'nom'.tr,
                      labelText: 'nom'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'nom_message'.tr;
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
                  TextFormField(
                    controller: postnom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'postnom'.tr,
                      labelText: 'postnom'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'postnom_message'.tr;
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
                  TextFormField(
                    controller: prenom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'prenom'.tr,
                      labelText: 'prenom'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'prenom_message'.tr;
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
                  TextFormField(
                    controller: telephone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'Téléphone'.tr,
                      labelText: 'Téléphone'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 9) {
                        return 'Téléphone_message'.tr;
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
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'email'.tr,
                      labelText: 'email'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email_message'.tr;
                      } else if (!value.isEmail) {
                        return "Email erreur";
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
                  TextFormField(
                    controller: adresse,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                      hintText: 'adresse'.tr,
                      labelText: 'adresse'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'adresse_message'.tr;
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
                  Obx(
                    () => Container(
                      height: 55,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.manage_accounts,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                items: const [
                                  //"Chauffeur","Receveur","Embarqueur"
                                  DropdownMenuItem(
                                    child: Text("Chauffeur"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Receveur"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Embarqueur"),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Vendeur"),
                                    value: 4,
                                  ),
                                ],
                                onChanged: (e) {
                                  c.value = e as int;
                                },
                                value: c.value,
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                Map u = {
                  //"id": 2,
                  "idPartenaire": 1,
                  "nom": nom.text,
                  "postnom": postnom.text,
                  "prenom": prenom.text,
                  "numero": "243${telephone.text}",
                  "email": email.text,
                  "adresse": adresse.text,
                  "password": "1234567",
                  "role": c.value,
                  "roletitre": [
                    "Chauffeur",
                    "Receveur",
                    "Embarqueur",
                    "Vendeur",
                  ][c.value - 1],
                  "actif": true,
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
                /*
                {
                  "nom": nom.text,
                  "email": email.text,
                  "numero": telephone.text,
                  "codePostal": pays,
                  "nomEntreprise": "",
                  "adresseEntreprise": "",
                  "gradeDansEntreprise": "",
                  "autreInfos": "",
                  "prime": "",
                };
                */
                agentController.enregistrement(u);
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
