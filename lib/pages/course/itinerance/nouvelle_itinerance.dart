import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';
import 'package:random_string/random_string.dart';

class NouvelleItinerance extends StatefulWidget {
  //
  List l = [];
  Map e;
  State state;
  NouvelleItinerance(this.l, this.e, this.state);
  //
  @override
  State<StatefulWidget> createState() {
    //
    return _NouvelleItinerance();
  }
}

class _NouvelleItinerance extends State<NouvelleItinerance> {
  @override
  void initState() {
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouvelle Itineraire",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        bottom: PreferredSize(
          preferredSize: Size(100, 30),
          child: Container(
            height: 30,
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
                          child: Text(
                              "${widget.e['depart']} -> ${widget.e['arrive']}"),
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
              widget.l.length,
              (index) {
                Map e = widget.l[index];
                //TextEditingController text = TextEditingController();
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
                                  "${e['arretDepart']['nom']}",
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
                                  "${e['arretArrive']['nom']}",
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
                              suffix: Text("CDF"),
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
          InkWell(
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
              List it = [];
              Map r = {};
              widget.l.forEach((e) {
                if (e['active']) {
                  Map a = {};
                  //
                  a['idPartenaire'] = "1"; //Le id du groupe
                  a['nom'] = "${widget.e['depart']} à ${widget.e['arrive']}";
                  a['aaProvince'] = e['arretArrive']['province'];
                  a['aaLieu'] = e['arretArrive']['nom'];
                  a['aaLatitude'] = e['arretArrive']['latitude'];
                  a['aaLongitude'] = e['arretArrive']['longitude'];
                  a['adProvince'] = e['arretDepart']['province'];
                  a['adLieu'] = e['arretDepart']['nom'];
                  a['adLatitude'] = e['arretDepart']['latitude'];
                  a['adLongitude'] = e['arretDepart']['longitude'];
                  a['prix'] = e['prix'];
                  a['active'] = true;
                  //
                  it.add(a);
                  //
                  print(e);
                  l.add(e);
                }
              });
              //
              ItineranceController itineranceController = Get.find();
              bool b = await itineranceController.setItinerance(it);
              if (b) {
                // r["titre"] = "${widget.e['depart']} -> ${widget.e['arrive']}";
                // r["liste"] = l;

                // List listeFinal = box.read("Itinerance") ?? [];
                // listeFinal.add(r);

                // box.write("Itinerance", listeFinal);
                Get.back();
                Get.back();
                Get.snackbar(
                  "Effectué",
                  "Enregistrement éffectué avec succès",
                  colorText: Colors.white,
                  snackStyle: SnackStyle.GROUNDED,
                );
                widget.state.setState(() {});
              } else {
                Get.snackbar("Erreur",
                    "Un problème est survenu lors de l'enregistrement.");
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
        ],
      ),
    );
  }
}
