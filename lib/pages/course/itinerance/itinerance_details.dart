import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';

class ItineranceDetails extends StatefulWidget {
  int index;
  List e;
  String nom;
  State state;
  ItineranceDetails(this.e, this.index, this.state, this.nom);
  @override
  State<StatefulWidget> createState() {
    return _ItineranceDetails();
  }
}

class _ItineranceDetails extends State<ItineranceDetails> {
  List ll = [];
  ItineranceController itineranceController = Get.find();
  //
  @override
  void initState() {
    //
    ll = widget.e;
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier ou Supprimer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        bottom: PreferredSize(
          preferredSize: Size(100, 35),
          child: Container(
            height: 35,
            color: Colors.indigo.shade100,
            child: Row(
              children: [
                Container(
                  width: 6,
                  color: Colors.indigoAccent.shade400,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.nom),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: List.generate(
              ll.length,
              (index) {
                Map e = ll[index];
                var p = "${e['prix']}";
                TextEditingController text =
                    TextEditingController(text: "${e['prix']}");
                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${e['adLieu']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${e['aaLieu']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextField(
                            //controller: text,
                            enabled: e['active'],
                            keyboardType: TextInputType.number,
                            onChanged: (tt) {
                              //
                              setState(() {
                                e['prix'] = tt;
                                //text.text = "${e['prix']}";
                              });
                            },
                            decoration: InputDecoration(
                              suffix: const Text("CDF"),
                              hintText: p,
                              label: Text(p),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Switch(
                            onChanged: (s) {
                              setState(() {
                                e['active'] = s;
                              });
                            },
                            value: e['active'],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () async {
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    //
                    var box = GetStorage();
                    List l = [];
                    Map r = {};
                    ll.forEach((e) {
                      if (e['active']) {
                        l.add(e);
                      }
                    });
                    bool b = await itineranceController.updateItinerance(l);
                    if (b) {
                      // r["titre"] = widget.nom;
                      // r["liste"] = l;

                      itineranceController.listeResumer.clear();
                      List liste =
                          await itineranceController.getAllItinerancesSave();
                      liste.forEach((element) {
                        itineranceController.listeResumer.add(element['nom']);
                      });

                      // List listeFinal = box.read("Itinerance") ?? [];
                      // listeFinal.removeAt(widget.index);
                      // listeFinal.add(r);

                      // box.write("Itinerance", listeFinal);
                      Get.back();
                      Get.back();
                      Get.snackbar(
                        "Effectué",
                        "Mise à jour éffectué avec succès",
                        colorText: Colors.white,
                        snackStyle: SnackStyle.GROUNDED,
                      );
                      widget.state.setState(() {});
                      //
                    } else {
                      Get.snackbar("Erreur",
                          "Un problème est survenu lors de la mise à jour.");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 0,
                      right: 0,
                      bottom: 2,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
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
                        "Modifier".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () async {
                    Get.dialog(
                      const Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    //
                    bool b =
                        await itineranceController.deleteItinerance(widget.e);
                    if (b) {
                      // var box = GetStorage();
                      itineranceController.listeResumer.clear();
                      List liste =
                          await itineranceController.getAllItinerancesSave();
                      liste.forEach((element) {
                        itineranceController.listeResumer.add(element['nom']);
                      });
                      // List listeFinal = box.read("Itinerance") ?? [];
                      // listeFinal.removeAt(widget.index);
                      // //listeFinal.add(listeFinal);

                      // box.write("Itinerance", listeFinal);
                      Get.back();
                      Get.back();
                      Get.snackbar(
                        "Effectué",
                        "Suppression éffectué avec succès",
                        colorText: Colors.white,
                        snackStyle: SnackStyle.GROUNDED,
                      );
                      widget.state.setState(() {});
                    } else {
                      Get.snackbar("Erreur",
                          "Un problème est survenu lors de la suppression.");
                    }
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 0,
                      right: 0,
                      bottom: 2,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(10),
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                        // ),
                      ),
                      child: Text(
                        "Supprimer".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
