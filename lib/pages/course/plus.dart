import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/carte.dart';
import 'package:kenda_admin/pages/course/details_arrets.dart';
import 'package:kenda_admin/pages/course/infos.dart';
import 'package:kenda_admin/pages/course/infos_supplementaire.dart';
import 'package:kenda_admin/pages/course/reservation.dart';
import 'package:kenda_admin/widgets/modal.dart';
import 'package:timelines/timelines.dart';

class Plus extends StatefulWidget {
  Map e;
  Plus(this.e) {
    print("t: ${e['troncons']}");
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

  @override
  void initState() {
    //
    List l = widget.e['troncons'] ?? [];
    //
    l.forEach((element) {
      if (listTitre.add(element['arretArrive']['nom'])) {
        Map m = element;
        m['details'] = element['arretArrive'];
        listeArrets.add(m);
      } else if (listTitre.add(element['arretDepart']['nom'])) {
        Map m = element;
        m['details'] = element['arretDepart'];
        listeArrets.add(m);
      }
    });
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
                                  "${widget.e['provinceDepart']}, ${widget.e['lieuDepart']}",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "${widget.e['provinceArrive']}, ${widget.e['lieuArrive']}"),
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
                          "Départ : ${getDateDepart("${widget.e['heureDepart']}")}",
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
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: widget.e['terminer']
                                    ? MaterialStateProperty.all(
                                        Colors.green.shade900)
                                    : MaterialStateProperty.all(
                                        Colors.blue.shade900),
                              ),
                              icon: widget.e['terminer']
                                  ? Icon(Icons.check_circle)
                                  : Icon(Icons.timelapse),
                              label: Text(
                                widget.e['terminer'] ? 'Terminé' : 'En coure',
                                style: TextStyle(
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
                          "Durée : ${getDuree('${widget.e['heureDepart']}', '${widget.e['heureArrive']}')}",
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Arrets"),
                    ),
                    Column(
                      children: List.generate(listeArrets.length, (index) {
                        Map x = listeArrets[index];
                        return ListTile(
                          onTap: () {
                            //Get.to(
                            //ArretsDetails(widget.e['troncons'], 0, this),
                            //);
                          },
                          leading: Icon(Icons.location_on_outlined),
                          title: Text(
                              "${x['details']['province']} ${x['details']['nom']}"),
                          subtitle: Text("12 Passagers"),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        );
                      }),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        //Get.to(
                        //ArretsDetails(widget.e['troncons'], 0, this),
                        //);
                      },
                      //leading: Icon(Icons.all_inbox),
                      title: Text("Total"),
                      subtitle: Text("120 Passagers"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
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

  //
  String getDateDepart(String date) {
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

  //
  String getDuree(String dateDepart, String dateArrive) {
    int year1 = int.parse(dateDepart.split(" ")[0].split("-")[0]);
    int month1 = int.parse(dateDepart.split(" ")[0].split("-")[1]);
    int day1 = int.parse(dateDepart.split(" ")[0].split("-")[2]);
    //
    int heure1 = int.parse(dateDepart.split(" ")[1].split(":")[1]);
    int min1 = int.parse(dateDepart.split(" ")[1].split(":")[2]);
    DateTime d1 = DateTime(year1, month1, day1, heure1, min1);
    //
    int year2 = int.parse(dateArrive.split(" ")[0].split("-")[0]);
    int month2 = int.parse(dateArrive.split(" ")[0].split("-")[1]);
    int day2 = int.parse(dateArrive.split(" ")[0].split("-")[2]);
    //
    int heure2 = int.parse(dateArrive.split(" ")[1].split(":")[1]);
    int min2 = int.parse(dateArrive.split(" ")[1].split(":")[2]);
    DateTime d2 = DateTime(year2, month2, day2, heure2, min2);
    //
    Duration heure = d2.difference(d1);
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "${heure.inHours} h";
  }
  //

}
