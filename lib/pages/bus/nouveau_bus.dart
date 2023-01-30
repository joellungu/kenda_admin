import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bus_controller.dart';

class FormulaireBus extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final marque = TextEditingController();
  final type = TextEditingController();
  final numeroChassis = TextEditingController();
  RxString dateAchat = "${DateTime.now()}".obs;
  RxString dateMiseenservice = "${DateTime.now()}".obs;
  var capacite = TextEditingController(text: "50");
  var caracteristiques = TextEditingController();
  var kilometrage = TextEditingController();
  RxBool climatisation = true.obs;
  //
  BusController busController = Get.find();
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
              "Nouveeau bus",
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
                      //prefixIcon: const Icon(Icons.person),
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
                    controller: marque,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.person),
                      hintText: 'marque'.tr,
                      labelText: 'marque'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'marque_message'.tr;
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
                    controller: type,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.person),
                      hintText: 'type'.tr,
                      labelText: 'type'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'type_message'.tr;
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
                    controller: numeroChassis,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.phone),
                      hintText: 'numero chassis'.tr,
                      labelText: 'numero chassis'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
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
                            child: Text("Date d'achat: ${dateAchat.value}"),
                          ),
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              ).then((d) {
                                //
                                dateAchat.value =
                                    "${d!.year}-${d.month}-${d.day}";
                                //
                              });
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
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
                            child: Text(
                                "Date mise en service: ${dateMiseenservice.value}"),
                          ),
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              ).then((d) {
                                //
                                dateMiseenservice.value =
                                    "${d!.year}-${d.month}-${d.day}";
                                //
                              });
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: capacite,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.phone),
                      hintText: 'capacite'.tr,
                      labelText: 'capacite'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'capacite_message'.tr;
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
                    controller: caracteristiques,
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.email),
                      hintText: 'caracteristiques'.tr,
                      labelText: 'caracteristiques'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'caracteristiques_message'.tr;
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
                    controller: kilometrage,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //prefixIcon: const Icon(Icons.email),
                      hintText: 'kilometrage'.tr,
                      labelText: 'kilometrage'.tr,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'kilometrage_message'.tr;
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
                    () => SwitchListTile(
                      title: Text("Climatisation"),
                      onChanged: (e) {
                        climatisation.value = e;
                      },
                      value: climatisation.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                Map u = {
                  "idPartenaire": 1,
                  "nom": nom.text,
                  "marque": marque.text,
                  "type": type.text,
                  "numeroChassis": numeroChassis.text,
                  "dateAchat": dateAchat.value,
                  "dateMiseenservice": dateMiseenservice.value,
                  "capacite": capacite.text,
                  "caracteristiques": caracteristiques.text,
                  "kilometrage": kilometrage.text,
                  "climatisation": climatisation.value,
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
                busController.enregistrement(u);
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
