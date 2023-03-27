import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/carte.dart';
import 'package:kenda_admin/pages/course/details_arrets.dart';
import 'package:kenda_admin/pages/course/infos.dart';
import 'package:kenda_admin/pages/course/infos_supplementaire.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';
import 'package:kenda_admin/pages/course/reservation.dart';
import 'package:kenda_admin/widgets/modal.dart';
import 'package:timelines/timelines.dart';

import 'rapports/detail_rapport.dart';
import 'rapports/rapport.dart';
import 'rapports/rapport_controller.dart';

class Plus extends StatefulWidget {
  Map e;
  Plus(this.e) {
    print("t: $e");
  }
  //
  @override
  State<StatefulWidget> createState() {
    return _Plus();
  }
}

class _Plus extends State<Plus> {
  List listeArrets = [];
  Set listTitre = Set();
  RxList ll = [].obs; //
  RapportController rapportController = Get.find();
  //
  List liste = []; //box.read("Itinerance") ?? [];
  getIts() async {
    ll.value = await rapportController.getRapportAgent("15-3-2023");
    // liste.forEach((element) {
    //   itineranceController.listeResumer.add(element['nom']);
    // });
  }

  @override
  void initState() {
    //
    //

    getIts();
    //
    super.initState();
  }

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
              "Rapports de la course",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: Container(
            //color: Colors.blue,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 22,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Départ : ${[
                        "Lundi",
                        "Mardi",
                        "Mercredi",
                        "Jeudi",
                        "Vendredi",
                        "Samedi",
                        "Dimanche"
                      ][widget.e['jourDepart']]}",
                      //"Départ : dim. 4 déc",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.e['heureDepart']}"
                              .split(" ")[1]
                              .substring(0, 5),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        // color: Colors.green,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 13,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        //color: Colors.green,
                        child: Text(
                          "${widget.e['heureArrive']}"
                              .split(" ")[1]
                              .substring(0, 5),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        alignment: Alignment.centerRight,
                        // child: ElevatedButton(
                        //   onPressed: () {},
                        //   style: ButtonStyle(
                        //     backgroundColor: MaterialStateProperty.all(
                        //         Colors.red.shade900),
                        //   ),
                        //   child: Text(
                        //     widget.e['status'] == 0
                        //         ? "Suspendre"
                        //         : "Reprendre",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),

                        height: 35, //color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 22,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Durée : ${getDuree('${widget.e['heureDepart']}', '${widget.e['heureArrive']}', widget.e['nombreJours'])}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Column(
                      children: List.generate(
                        ll.length,
                        (index) {
                          Map e = ll[index];
                          return ListTile(
                            onTap: () {
                              Get.to(DetailRapport(e));
                            },
                            // leading: const Icon(
                            //   Icons.edit_note_rounded,
                            //   size: 40,
                            //   color: Colors.black,
                            // ),
                            title: Text(
                              "${e['object']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade900,
                              ),
                            ), //${e['adLieu']} à ${e['aaLieu']}
                            subtitle: Text("${e['date']}"),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Get.to(Rapport());
              //
            },
            backgroundColor: Colors.indigo.shade900,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          /*
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    //color: Colors.grey,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(
                      text: TextSpan(
                        text: "Prix pour 2 places\n",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "80.500 Fc",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    color: Colors.green.shade800,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        //
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (c) {
                            return Container(
                              height: Get.size.height / 1.05,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: TicketQrCode(),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Scaner",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          */
        ),
      ),
    );
  }

  /**
   *   
                      
   */

  //
  String getDateDeparts(String date) {
    int year = int.parse(date.split(" ")[0].split("-")[0]);
    int month = int.parse(date.split(" ")[0].split("-")[1]);
    int day = int.parse(date.split(" ")[0].split("-")[2]);
    DateTime d = DateTime(year, month, day);
    //
    //print("Le jour: ${d.weekday}");
    List jours = ['', 'lun', 'mar', 'mer', 'jeu', 'ven', 'sam', 'dim'];
    List mois = [
      '',
      'Jan',
      'Fev',
      'Mar',
      'Avr',
      'Mais',
      'Juin',
      'Juil',
      'Aout',
      'Sep',
      'Oct',
      'Nov',
      'Déc'
    ];
    //
    return "${jours[d.weekday]} $day ${mois[month]}";
  }

  String getDuree(String heureDepart, String heureArrive, int nombreJours) {
    //
    DateTime d1 = DateTime(0, 1, 1, int.parse(heureDepart.split(":")[0]),
        int.parse(heureDepart.split(":")[1]));
    DateTime d2 = DateTime(0, 1, 1, int.parse(heureArrive.split(":")[0]),
        int.parse(heureArrive.split(":")[1]));
    //
    Duration heure = d2.difference(d1);
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "${nombreJours == 1 ? heure.inHours : '$nombreJours J et ${heure.inHours}'} h";
  }
  //

}
