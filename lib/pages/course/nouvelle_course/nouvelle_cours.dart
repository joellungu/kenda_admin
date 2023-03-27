import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/agents/agent_controller.dart';
import 'package:kenda_admin/pages/bus/bus_controller.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';
import 'package:kenda_admin/widgets/loader.dart';
import 'nouvelle_course_controller.dart';

String? depart;
String? idArretDepart;
String? idArretArrive;
String? provinceDepart;
String? provinceArrive;
String? arrive;
//List _troncons = [];
RxList _equipages = [].obs;
RxMap bus = {}.obs;
RxMap chauffeur = {}.obs;
RxMap receveur = {}.obs;
RxMap embarqueur = {}.obs;
RxString itinerance = "".obs;
TextEditingController _reference = TextEditingController();
TextEditingController __datedepart = TextEditingController();
TextEditingController __heuredepart = TextEditingController();
TextEditingController __datearrive = TextEditingController();
TextEditingController __heurearrive = TextEditingController();
String _datedepart = "";
String _heuredepart = "";
String _datearrive = "";
String _heurearrive = "";
RxInt jour = 1.obs;
RxInt nombreJours = 1.obs;

class NouvelleCours extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NouvelleCours();
  }
}

class _NouvelleCours extends State<NouvelleCours> {
  Widget? vue;
  List<bool> choix = [true, false, false, false];
  NouvelleCourseController nouvelleCourseController = Get.find();
  @override
  void initState() {
    //
    vue = It();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouvelle course",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        bottom: PreferredSize(
          preferredSize: Size(100, 35),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 50,
            alignment: Alignment.center,
            color: Colors.grey.shade200,
            child: ToggleButtons(
              selectedColor: Colors.indigo.shade700,
              disabledColor: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(20),
              //borderColor: Colors.white,
              borderWidth: 1,
              onPressed: (e) {
                print(e);
                setState(() {
                  //
                  for (var i = 0; i < choix.length; i++) {
                    if (i == e) {
                      choix[i] = true;
                    } else {
                      choix[i] = false;
                    }
                  }
                  //
                  if (e == 0) {
                    vue = It();
                  } else if (e == 1) {
                    vue = Equipage();
                  } else if (e == 2) {
                    vue = Buss();
                  } else {
                    vue = Ref();
                  }
                  //
                });
              },
              isSelected: choix,
              children: [
                Text("  Itinerances "),
                Text(" Équipages "),
                Text("Bus"),
                Text(" Plus  "),
              ],
            ),
          ),
        ),
      ),
      body: vue,
      bottomNavigationBar: InkWell(
        onTap: () {
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
            String prix = "0";
            //
            /**
             * public Timestamp heureArrive;
                public String lieuDepart;
                public String provinceDepart;
                public String lieuArrive;
                public String provinceArrive;
             */
            //
            Map u = {
              "idPartenaire": 1,
              "idArretDepart": idArretDepart,
              "idArretArrive": idArretArrive,
              "chauffeur": chauffeur,
              "receveur": receveur,
              "arretEnCour": depart,
              "prix": prix,
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
            };
            embarqueur['nom'] == null ? u : u["embarqueur"] = embarqueur;
            print('la avleur u: ${u['troncons']}');
            //
            nouvelleCourseController.creerCourse(u);
            //
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
            decoration: BoxDecoration(
              color: Colors.indigo.shade900,
              borderRadius: BorderRadius.circular(10),
              // gradient: LinearGradient(
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerLeft,
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
      ),
    );
  }

  messageErreur(String text) {
    Get.dialog(
      AlertDialog(
        title: Text("Erreur"),
        content: Text(text),
      ),
    );
  }
}

class It extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _It();
  }
}

class _It extends State<It> {
  List liste = [];
  ItineranceController itineranceController = Get.find();
  //List liste = []; //box.read("Itinerance") ?? [];
  getIts() async {
    liste = await itineranceController.getAllItinerancesSave();
    liste.forEach((element) {
      itineranceController.listeResumer.add(element['nom']);
    });
  }

  RxInt i = (-1).obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    getIts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: [
      itinerance.isNotEmpty
          ? ListTile(
              leading: Icon(Icons.directions_walk),
              //const Icon(CupertinoIcons.doc_append),
              title: Text(
                itinerance.value,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade900,
                ),
              ),
              //subtitle: Text("Arrets ${itinerance['liste'].length}"),
              trailing: const Icon(
                Icons.check,
                color: Colors.green,
                size: 30,
              ),
            )
          : Container(),
      Container(
        height: 3,
        color: Colors.black,
      ),
      Obx(
        () => Column(
          children:
              List.generate(itineranceController.listeResumer.length, (index) {
            return ListTile(
              onTap: () {
                //
                setState(() {
                  itinerance.value =
                      "${itineranceController.listeResumer.elementAt(index)}";
                });
                //
                //
              },
              leading: Icon(Icons.directions_walk),
              //const Icon(CupertinoIcons.doc_append),
              title: Text(
                "${itineranceController.listeResumer.elementAt(index)}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade900,
                ),
              ),
              //subtitle: Text("Arrets ${liste[index]['liste'].length}"),
            );
          }),
        ),
      ),
    ]);
  }
}

class Equipage extends GetView<AgentController> {
  Equipage() {
    controller.load(1);
  }

  //
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
        print(l);
        return ListView(children: [
          Obx(
            () => chauffeur["id"] != null
                ? ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${chauffeur['nom']} ${chauffeur['postnom']} ${chauffeur['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${chauffeur['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30,
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => receveur["id"] != null
                ? ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${receveur['nom']} ${receveur['postnom']} ${receveur['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${receveur['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30,
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => embarqueur["id"] != null
                ? ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${embarqueur['nom']} ${embarqueur['postnom']} ${embarqueur['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${embarqueur['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30,
                    ),
                  )
                : Container(),
          ),
          Container(
            height: 3,
            color: Colors.black,
          ),
          Column(
            children: List.generate(l.length, (index) {
              Map e = l[index];
              RxInt n = (-1).obs; //index.obs;
              return Obx(
                () => ListTile(
                  onTap: () {
                    print(e);
                    //
                    if (e['role'] == 1) {
                      chauffeur.value = e;
                    } else if (e['role'] == 2) {
                      receveur.value = e;
                    } else {
                      embarqueur.value = e;
                    }
                    print(n.value);
                    //
                  },
                  leading: const Icon(
                    CupertinoIcons.person,
                    size: 40,
                  ),
                  title: Text(
                    "${e['nom']} ${e['postnom']} ${e['prenom']}",
                    style: TextStyle(
                      //fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  subtitle: Text(
                    "${e['roletitre']}",
                    style: TextStyle(
                      //fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  trailing: n.value == index
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 30,
                        )
                      : Container(
                          height: 30,
                          width: 30,
                        ),
                ),
              );
            }),
          )
        ]);
      },
      onEmpty: Container(
          //color: Colors.indigo.shade900,
          ),
      onError: (e) {
        return Container();
      },
      onLoading: Loader(),
    );
  }
}

class Buss extends GetView<BusController> {
  Buss() {
    controller.load(1);
  }
  //
  RxInt i = (-1).obs;

  //
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
        return Obx(
          () => ListView(
            children: [
              bus["id"] != null
                  ? ListTile(
                      leading: const Icon(
                        CupertinoIcons.bus,
                        size: 40,
                      ),
                      title: Text(
                        "${bus['marque']}",
                        style: TextStyle(
                          //fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      subtitle: Text(
                        "${bus['type']}",
                        style: const TextStyle(
                          //fontSize: 17,
                          fontWeight: FontWeight.w900,
                          //color: Colors.grey.shade900,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 30,
                      ),
                    )
                  : Container(),
              Container(
                height: 3,
                color: Colors.black,
              ),
              Column(
                children: List.generate(l.length, (index) {
                  Map e = l[index];
                  return ListTile(
                    onTap: () {
                      //
                      i.value = index;
                      bus.value = e;
                      //print(e);
                      //
                    },
                    leading: const Icon(
                      CupertinoIcons.bus,
                      size: 40,
                    ),
                    title: Text(
                      "${e['marque']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${e['type']}",
                      style: const TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        //color: Colors.grey.shade900,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        );
      },
      onEmpty: Container(
          //color: Colors.indigo.shade900,
          ),
      onError: (e) {
        return Container();
      },
      onLoading: Loader(),
    );
  }
}

class Ref extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Ref();
  }
}

class _Ref extends State<Ref> {
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
            )
          ],
        ),
      ),
    );
  }
}
