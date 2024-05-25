import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'profile_controller.dart';

class Profile extends StatelessWidget {
  //
  ProfileController profileController = Get.find();
  //
  var box = GetStorage();
  //
  Map proprietaire = {};
  //
  Profile() {
    //
    proprietaire = box.read("user") ?? {};
    print("proprietaire: $proprietaire");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("Nom"),
            subtitle: Text("${proprietaire['nom']}"),
            // trailing: IconButton(
            //   onPressed: () {
            //     //
            //     var adresse = TextEditingController();
            //     modifierInfo(e, context, adresse,
            //         "adresseEtablissement");
            //   },
            //   icon: const Icon(Icons.edit),
            // ),
          ),
          ListTile(
            title: const Text("Postnom"),
            subtitle: Text("${proprietaire['postnom']}"),
            // trailing: IconButton(
            //   onPressed: () {
            //     //
            //     var dateNaissance = TextEditingController();
            //     modifierInfo(e, context, dateNaissance,
            //         "denomination");
            //   },
            //   icon: const Icon(Icons.edit),
            // ),
          ),
          ListTile(
            title: const Text("Prenom"),
            subtitle: Text("${proprietaire['prenom']}"),
            // trailing: IconButton(
            //   onPressed: () {
            //     //
            //     var dateNaissance = TextEditingController();
            //     modifierInfo(e, context, dateNaissance,
            //         "adresseEtablissement");
            //   },
            //   icon: const Icon(Icons.edit),
            // ),
          ),
          ListTile(
            title: const Text("Téléphone"),
            subtitle: Text("${proprietaire['numero']}"),
            // trailing: IconButton(
            //   onPressed: () {
            //     //
            //     var dateNaissance = TextEditingController();
            //     modifierInfo(e, context, dateNaissance,
            //         "provinceSiege");
            //   },
            //   icon: const Icon(Icons.edit),
            // ),
          ),
          ListTile(
            title: const Text("Mot de passe"),
            subtitle:
                const Text("***************"), //${proprietaire['password']}
            trailing: IconButton(
              onPressed: () {
                //
                var password = TextEditingController();
                modifierInfo(proprietaire, context, password, "password");
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }

  //
  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom] ?? "";
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
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
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        profileController.putData(e);
                        //Mise à jour ici...
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
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
