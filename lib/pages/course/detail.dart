import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/carte.dart';
import 'package:kenda_admin/pages/course/course_controller.dart';
import 'package:kenda_admin/pages/course/details_arrets.dart';
import 'package:kenda_admin/pages/course/infos.dart';
import 'package:kenda_admin/pages/course/infos_supplementaire.dart';
import 'package:kenda_admin/pages/course/plus.dart';
import 'package:kenda_admin/pages/course/reservation.dart';
import 'package:kenda_admin/widgets/modal.dart';
import 'package:timelines/timelines.dart';

import 'rapports/reservation_rapport.dart';

class Detail extends StatefulWidget {
  Map e;
  Detail(this.e) {
    print("t: ${e['status']}");
  }
  //
  @override
  State<StatefulWidget> createState() {
    return _Detail();
  }
}

class _Detail extends State<Detail> {
  //
  CourseController courseController = Get.find();
  //
  int arrs = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    print(widget.e);
    // List l = widget.e['troncons'] ?? [];
    //Set listTitre = Set();
    //
    // l.forEach((element) {
    //   if (listTitre.add(element['arretArrive']['nom'])) {
    //     arrs++;
    //   } else if (listTitre.add(element['arretDepart']['nom'])) {
    //     arrs++;
    //   }
    // });
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
              "Détails de la course",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: ListView(
            children: [
              Container(
                height: Get.size.height / 7,
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
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Trajet éffectué en bus"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${widget.e['troncons']}",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                //child: Text(
                                //  "${widget.e['provinceArrive']}, ${widget.e['lieuArrive']}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.size.height / 7,
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
                            "",
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
                            child: ElevatedButton(
                              onPressed: () async {
                                //courses/suspendre/widget.e['id']/
                                //widget.e['jourDepart']
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
                                int vSus = widget.e['status'] == 0 ? 1 : 0;
                                courseController.setStatus("${widget.e['id']}",
                                    vSus, widget.e['jourDepart']);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.red.shade900),
                              ),
                              child: Text(
                                widget.e['status'] == 0
                                    ? "Suspendre"
                                    : "Reprendre",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            //color: Colors.blue,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        //
                        showSimpleModal(
                            InfoSupplementaire(
                              details: widget.e,
                            ),
                            context);
                      },
                      leading: const Icon(CupertinoIcons.gauge),
                      title: const Text("Informations supplémentaire"),
                      subtitle: const Text("Détails"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     //showSimpleModal(Reservation(), context);
                    //   },
                    //   //airline_seat_recline_extra_rounded
                    //   leading: Icon(CupertinoIcons.bus),
                    //   title: Text("Emplacement du bus actuellement"),
                    //   subtitle: Text("Kongo central / Boma"),
                    //   trailing: const Icon(
                    //     Icons.arrow_forward_ios,
                    //     size: 15,
                    //   ),
                    // ),
                    ListTile(
                      onTap: () {
                        /*
                        getIts() async {
                          liste = await itineranceController.getAllItinerancesSave();
                          liste.forEach((element) {
                            itineranceController.listeResumer.add(element['nom']);
                          });
                        }
                        */
                        Get.to(
                          ArretsDetails(widget.e['troncons'], 0, this),
                        );
                      },
                      leading: Icon(Icons.location_on_outlined),
                      title: Text("Arrets"),
                      //subtitle: Text("$arrs arrets"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ReservationRapport(widget.e, "", ""));
                        //Reservation
                      },
                      leading: const Icon(Icons.calendar_today),
                      title: const Text("Rapports"),
                      //subtitle: Text("..."),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Padding(
                    //       padding: EdgeInsets.only(left: 20, bottom: 10),
                    //       child: Text("Arrets"),
                    //     )),
                    // //Trajectoire(),
                    // //Trajectoire(),//
                    // Timeline.tileBuilder(
                    //   shrinkWrap: true,
                    //   physics: ClampingScrollPhysics(),
                    //   builder: TimelineTileBuilder.fromStyle(
                    //     contentsAlign: ContentsAlign.basic,
                    //     contentsBuilder: (context, index) {
                    //       Map a = widget.e['troncons'][index];
                    //       return Padding(
                    //         padding: const EdgeInsets.all(4.0),
                    //         child: ListTile(
                    //           title: Text("${a['arretDepart']['nom']}"),
                    //           subtitle: Text("${a['arretArrive']['nom']}"),
                    //         ),
                    //       );
                    //     },
                    //     itemCount: widget.e['troncons'].length,
                    //   ),
                    // )
                  ],
                ),
              )
            ],
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

class TicketQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    //
                    Get.back();
                    //
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Votre Qrcode",
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),

                //                           Text(
                //   "Info trajet",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //
                        //Get.back();
                        //
                      },
                      icon: const Icon(
                        CupertinoIcons.bus,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Transco Métro\n",
                        children: [
                          TextSpan(
                            text: "vers Boma",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("LOGO")
              ],
            ),
          ),
          Container(
            height: Get.size.height / 2,
            width: Get.size.width / 1.2,
            alignment: Alignment.center,
            child: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 250,
            ),
          )
        ],
      ),
    );
  }
}
