import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/formulaire1.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/formulaire2.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/formulaire3.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/formulaire4.dart';

String? depart;
String? idArretDepart;
String? idArretArrive;
String? provinceDepart;
String? provinceArrive;
String? arrive;
//List _troncons = [];
//RxList _equipages = [].obs;
RxMap bus = {}.obs;
RxMap chauffeur = {}.obs;
RxMap receveur = {}.obs;
RxMap embarqueur = {}.obs;
RxString itinerance = "".obs;
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
  //
  PageController controller = PageController();
  //
  ItineranceController itineranceController = Get.find();
  //
  @override
  void initState() {
    //
    //vue = It();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouvelle course",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        // bottom: PreferredSize(
        //   preferredSize: Size(100, 35),
        //   child: Container(
        //     padding: const EdgeInsets.all(5),
        //     height: 50,
        //     alignment: Alignment.center,
        //     color: Colors.grey.shade200,
        //     child: ToggleButtons(
        //       selectedColor: Colors.indigo.shade700,
        //       disabledColor: Colors.indigo.shade100,
        //       borderRadius: BorderRadius.circular(20),
        //       //borderColor: Colors.white,
        //       borderWidth: 1,
        //       onPressed: (e) {
        //         print(e);
        //         setState(() {
        //           //
        //           for (var i = 0; i < choix.length; i++) {
        //             if (i == e) {
        //               choix[i] = true;
        //             } else {
        //               choix[i] = false;
        //             }
        //           }
        //           //
        //           if (e == 0) {
        //             vue = It();
        //           } else if (e == 1) {
        //             vue = Equipage();
        //           } else if (e == 2) {
        //             vue = Buss();
        //           } else {
        //             vue = Ref();
        //           }
        //           //
        //         });
        //       },
        //       isSelected: choix,
        //       children: [
        //         Text("  Itinerances "),
        //         Text(" Équipages "),
        //         Text("Bus"),
        //         Text(" Plus  "),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: PageView(
        controller: controller,
        children: [
          Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("Choix d'itinerence"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: It(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    //
                    if (itinerance.isNotEmpty) {
                      //
                      controller.nextPage(
                          duration: const Duration(microseconds: 10),
                          curve: Curves.linear);
                    } else {
                      Get.snackbar(
                          "Erreur", "Veuillez selection une itinerence");
                    }
                  },
                  child: const Text("Suivant"),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("Choix d'équipage"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Equipage(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //
                      controller.previousPage(
                          duration: const Duration(microseconds: 10),
                          curve: Curves.linear);
                    },
                    child: const Text("Retour"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //
                      if (receveur["id"] != null && chauffeur["id"] != null) {
                        controller.nextPage(
                            duration: const Duration(microseconds: 10),
                            curve: Curves.linear);
                      } else {
                        Get.snackbar(
                            "Erreur", "Veuillez selection l'équipage.");
                      }
                    },
                    child: const Text("Suivant"),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("Choix du buss"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Buss(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //
                      controller.previousPage(
                          duration: const Duration(microseconds: 10),
                          curve: Curves.linear);
                    },
                    child: const Text("Retour"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //
                      if (bus["id"] != null) {
                        controller.nextPage(
                            duration: const Duration(microseconds: 10),
                            curve: Curves.linear);
                      } else {
                        Get.snackbar("Erreur", "Veuillez selection le buss.");
                      }
                    },
                    child: const Text("Suivant"),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text("Date et reference"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Ref(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //
                      controller.previousPage(
                          duration: const Duration(microseconds: 10),
                          curve: Curves.linear);
                    },
                    child: const Text("Retour"),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     //
                  //   },
                  //   child: const Text("Enregistrer"),
                  // ),
                ],
              )
            ],
          ),
        ],
      ), // vue,
    );
  }
}
