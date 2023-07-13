import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bus_controller.dart';

class DetailsBus extends StatelessWidget {
  Map e;
  DetailsBus(this.e) {
    print(e);
  }
  //
  BusController busController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SwitchListTile(
                title: Text("climatisation"),
                onChanged: (e) {},
                value: true,
              ),
            ),
          ],
        ),
        ListTile(
          title: Text("Nom"),
          subtitle: Text(e["nom"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var nom = TextEditingController();
              //
              modifierInfo(e, context, nom, "nom");
            },
          ),
        ),
        ListTile(
          title: Text("marque"),
          subtitle: Text(e["marque"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var marque = TextEditingController();
              //
              modifierInfo(e, context, marque, "marque");
            },
          ),
        ),
        ListTile(
          title: Text("type"),
          subtitle: Text(e["type"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var type = TextEditingController();
              //
              modifierInfo(e, context, type, "type");
            },
          ),
        ),
        ListTile(
          title: Text("numeroChassis"),
          subtitle: Text("${e["numeroChassis"]}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var numeroChassis = TextEditingController();
              //
              modifierInfo(e, context, numeroChassis, "numeroChassis");
            },
          ),
        ),
        ListTile(
          title: Text("dateAchat"),
          subtitle: Text(e["dateAchat"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var dateAchat = TextEditingController();
              //
              modifierInfo(e, context, dateAchat, "dateAchat");
            },
          ),
        ),
        ListTile(
          title: Text("dateMiseenservice"),
          subtitle: Text(e["dateMiseenservice"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var dateMiseenservice = TextEditingController();
              //
              modifierInfo(e, context, dateMiseenservice, "dateMiseenservice");
            },
          ),
        ),
        ListTile(
          title: Text("capacite"),
          subtitle: Text("${e['capacite']}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var capacite = TextEditingController();
              //
              modifierInfo(e, context, capacite, "capacite");
            },
          ),
        ),
        ListTile(
          title: Text("caracteristiques"),
          subtitle: Text(e["caracteristiques"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var caracteristiques = TextEditingController();
              //
              modifierInfo(e, context, caracteristiques, "caracteristiques");
            },
          ),
        ),
        ListTile(
          //
          title: Text("kilometrage"),
          subtitle: Text("${e['kilometrage']}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var kilometrage = TextEditingController();
              //
              modifierInfo(e, context, kilometrage, "kilometrage");
            },
          ),
        ),
        ListTile(
          //climatisation
          title: Text("climatisation"),
          subtitle: Text(e["climatisation"] ? 'OUI' : 'NON'),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var climatisation = TextEditingController();
              //
              modifierInfo(e, context, climatisation, "climatisation");
            },
          ),
        ),
        ListTile(
          //climatisation
          title: Text("numeroPlaque"),
          subtitle: Text(e["numeroPlaque"] ?? ''),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var climatisation = TextEditingController();
              //
              modifierInfo(e, context, climatisation, "numeroPlaque");
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
                busController.supprimer("${e["id"]}");
              },
              child: Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Supprimer",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom];
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
                        //Mise ) jour ici...
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
