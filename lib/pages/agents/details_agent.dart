import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/agents/agent_controller.dart';

class DetailsAgent extends StatelessWidget {
  Map e;
  DetailsAgent(this.e) {
    print(e);
  }
  AgentController agentController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      //padding: const EdgeInsets.all(10),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SwitchListTile(
                title: Text("Status"),
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
          title: Text("Postnom"),
          subtitle: Text(e["postnom"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var postnom = TextEditingController();
              //
              modifierInfo(e, context, postnom, "postnom");
            },
          ),
        ),
        ListTile(
          title: Text("Prenom"),
          subtitle: Text(e["prenom"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var prenom = TextEditingController();
              //
              modifierInfo(e, context, prenom, "prenom");
            },
          ),
        ),
        ListTile(
          title: Text("Téléphone"),
          subtitle: Text("${e["numero"]}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var numero = TextEditingController();
              //
              modifierInfo(e, context, numero, "numero");
            },
          ),
        ),
        ListTile(
          title: Text("Email"),
          subtitle: Text(e["email"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var email = TextEditingController();
              //
              modifierInfo(e, context, email, "email");
            },
          ),
        ),
        ListTile(
          title: Text("Adresse"),
          subtitle: Text(e["adresse"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var adresse = TextEditingController();
              //
              modifierInfo(e, context, adresse, "adresse");
            },
          ),
        ),
        ListTile(
          title: Text("Role"),
          subtitle: Text(e["roletitre"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
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
                  agentController.supprimer("${e["id"]}");
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
