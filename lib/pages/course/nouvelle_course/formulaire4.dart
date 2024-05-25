import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/nouvelle_cours.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/nouvelle_course_controller.dart';

class Ref extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Ref();
  }
}

class _Ref extends State<Ref> {
  //
  TextEditingController _reference = TextEditingController();
  TextEditingController __datedepart = TextEditingController();
  TextEditingController __heuredepart = TextEditingController();
  TextEditingController __datearrive = TextEditingController();
  TextEditingController __heurearrive = TextEditingController();
  String _datedepart = "";
  String _heuredepart = "";
  String _datearrive = "";
  String _heurearrive = "";
  //
  NouvelleCourseController nouvelleCourseController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Text("Jour"),
                ),
                Expanded(
                  flex: 5,
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: jour.value,
                        items: List.generate(
                          7,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text([
                              "Lundi",
                              "Mardi",
                              "Mercredi",
                              "Jeudi",
                              "Vendredi",
                              "Samedi",
                              "Dimanche"
                            ][index]),
                          ),
                        ),
                        onChanged: (j) {
                          jour.value = j as int;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Text("Nombre de jour"),
                ),
                Expanded(
                  flex: 5,
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: nombreJours.value,
                        items: List.generate(
                          30,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text("${index + 1}"),
                          ),
                        ),
                        onChanged: (j) {
                          nombreJours.value = j as int;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Heure départ"),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: __heuredepart,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((h) {
                                    //HH:mm:ss
                                    String hh = h!.hour < 9
                                        ? '0${h.hour}'
                                        : '${h.hour}';
                                    String mm = h.minute < 9
                                        ? '0${h.minute}'
                                        : '${h.minute}';
                                    //String ss = h. < 9 ? '0${h.hour}':'${h.hour}';
                                    _heuredepart = "$hh:$mm:00";
                                    __heuredepart.text = _heuredepart;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(Icons.timelapse),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Heure arrivée"),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: __heurearrive,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  //
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((h) {
                                    //HH:mm:ss
                                    String hh = h!.hour < 9
                                        ? '0${h.hour}'
                                        : '${h.hour}';
                                    String mm = h.minute < 9
                                        ? '0${h.minute}'
                                        : '${h.minute}';
                                    //String ss = h. < 9 ? '0${h.hour}':'${h.hour}';
                                    _heurearrive = "$hh:$mm:00";
                                    print(_heurearrive);
                                    __heurearrive.text = _heurearrive;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(Icons.timelapse),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Le lieux de rendez-vous pour le passagers",
                style: TextStyle(
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  //fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              //width: 300,
              child: TextField(
                controller: _reference,
                maxLength: 1000,
                maxLines: 7,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(),
            ElevatedButton(
              onPressed: () async {
                //
                if (itinerance.isEmpty) {
                  messageErreur("Veuillez selectionner une itinerance.");
                } else if (bus['id'] == null) {
                  messageErreur("Veuillez selectionner un bus.");
                } else if (_reference.text.isEmpty) {
                  messageErreur(
                      "Veuillez donner la référence du début de la course.");
                } else if (_heuredepart.isEmpty) {
                  messageErreur("Veuillez selectionner l'heure de départ.");
                } else if (_heurearrive.isEmpty) {
                  messageErreur("Veuillez selectionner l'heure d'arrivée.");
                } else {
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
                  //
                  Map e = box.read("user");
                  //
                  Map u = {
                    "idPartenaire": e['idPartenaire'],
                    "idArretDepart": idArretDepart,
                    "idArretArrive": idArretArrive,
                    "chauffeur": chauffeur,
                    "receveur": receveur,
                    "arretEnCour": depart,
                    "prix": "",
                    "heureDepart": "$_datedepart $_heuredepart",
                    "heureArrive": "$_datearrive $_heurearrive",
                    "bus": bus,
                    "jourDepart": jour.value,
                    "nombreJours": nombreJours.value,
                    "troncons": itinerance.value,
                    "placeDisponible": bus["capacite"],
                    "reference": _reference.text,
                    "lieuDepart": depart,
                    "provinceDepart": provinceDepart,
                    "lieuArrive": arrive,
                    "provinceArrive": provinceArrive,
                    "lieuActuel": depart,
                    "terminer": false,
                    "status": 0,
                  };
                  //embarqueur['nom'] == null ? u : u["embarqueur"] = embarqueur;
                  print('la avleur u: ${u['troncons']}');
                  //
                  nouvelleCourseController.creerCourse(u);
                  //
                }
              },
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }

  //
  messageErreur(String text) {
    Get.dialog(
      AlertDialog(
        title: Text("Erreur"),
        content: Text(text),
      ),
    );
  }
}
