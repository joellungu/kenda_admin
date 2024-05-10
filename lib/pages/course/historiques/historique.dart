import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kenda_admin/widgets/course_item.dart';
import 'historique_controller.dart';
import 'package:get/get.dart';

import 'jour.dart';

// class Historique extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _Historique();
//   }
// }

class Historique extends GetView<HistoriqueController> {
  RxInt mois = 1.obs;
  RxInt annee = 2024.obs;

  //
  //HistoriqueController controller = Get.find();

  //
  //TextEditingController annee = TextEditingController();
  Historique() {
    DateTime d = DateTime.now();
    annee.value = d.year;
    mois.value = d.month;
    //
    //controller.getAllCouresHistorique(6, 2023);
    controller.getAllCouresHistorique(mois.value, d.year);
  }

  @override
  Widget build(BuildContext context) {
    //

    //var dd = DateTimeRange(start: start, end: end);
    //
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
              "Historique de vos courses",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 105,
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
                              child: Text("Recherche"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: Text("Mois"),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Obx(
                                    () => DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        value: mois.value,
                                        items: List.generate(12, (index) {
                                          return DropdownMenuItem(
                                            child: Text("${index + 1}"),
                                            value: index + 1,
                                          );
                                        }),
                                        onChanged: (e) {
                                          //

                                          //
                                          print(e);
                                          mois.value = e!;
                                          //

                                          //controller.getListeUtilisateur();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 3,
                                  color: Colors.grey,
                                ),
                                const Expanded(
                                  flex: 3,
                                  child: Text("Année"),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Obx(
                                    () => DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        value: annee.value,
                                        items: List.generate(100, (index) {
                                          return DropdownMenuItem(
                                            child: Text("${index + 2023}"),
                                            value: index + 2023,
                                          );
                                        }),
                                        onChanged: (e) {
                                          //
                                          controller.totalX.value = 0;
                                          controller.lundiX.value = 0;
                                          controller.mardiX.value = 0;
                                          controller.mercrediX.value = 0;
                                          controller.jeudiX.value = 0;
                                          controller.vendrediX.value = 0;
                                          controller.samediX.value = 0;
                                          controller.dimancheX.value = 0;
                                          //
                                          print(e);
                                          annee.value = e!;
                                          //
                                          //controller.getListeUtilisateur();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 3,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: IconButton(
                                    onPressed: () async {
                                      controller.getAllCouresHistorique(
                                          mois.value, annee.value);
                                      // try {
                                      //   controller.getAllCouresHistorique(
                                      //       mois.value, int.parse(annee.text));
                                      // } catch (e) {
                                      //   Get.snackbar("Erreur",
                                      //       "Veuillez entrer une bonne année.");
                                      // }
                                    },
                                    icon: Icon(Icons.search),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                //height: Get.size.height / 1.5,
                child: controller.obx(
                  (state) {
                    //
                    List l = state!;
                    //
                    var du = DateUtils.getDaysInMonth(annee.value, mois.value);
                    print(du);
                    //
                    RxDouble tx = RxDouble(0);
                    RxDouble lu = RxDouble(0);
                    RxDouble ma = RxDouble(0);
                    RxDouble me = RxDouble(0);
                    RxDouble je = RxDouble(0);
                    RxDouble ve = RxDouble(0);
                    RxDouble sa = RxDouble(0);
                    RxDouble di = RxDouble(0);
                    //
                    return Column(
                      children: [
                        GridView.count(
                          crossAxisCount: 7,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          children: List.generate(du, (index) {
                            //
                            //Map e = l[index];
                            //
                            double totalX = 0;
                            double lundiX = 0;
                            double mardiX = 0;
                            double mercrediX = 0;
                            double jeudiX = 0;
                            double vendrediX = 0;
                            double samediX = 0;
                            double dimancheX = 0;
                            //
                            DateTime dt = DateTime(annee.value, mois.value);
                            //
                            double prix = 0;
                            //
                            var d = dt.add(Duration(days: index));
                            //
                            l.forEach((e) {
                              //
                              if (e['dateDepart'] ==
                                  "${d.day}-${d.month}-${d.year}") {
                                //
                                prix += e["prix"];
                                //
                                totalX = totalX + e["prix"];
                                tx.value = tx.value + e["prix"];

                                //
                                if (d.weekday == 1) {
                                  lundiX = lundiX + e["prix"];
                                  lu.value = lu.value + e["prix"];
                                } else if (d.weekday == 2) {
                                  mardiX = mardiX + e["prix"];
                                  ma.value = ma.value + e["prix"];
                                } else if (d.weekday == 3) {
                                  mercrediX = mercrediX + e["prix"];
                                  me.value = me.value + e["prix"];
                                } else if (d.weekday == 4) {
                                  jeudiX = jeudiX + e["prix"];
                                  je.value = je.value + e["prix"];
                                } else if (d.weekday == 5) {
                                  vendrediX = vendrediX + e["prix"];
                                  ve.value = ve.value + e["prix"];
                                } else if (d.weekday == 6) {
                                  samediX = samediX + e["prix"];
                                  sa.value = sa.value + e["prix"];
                                } else if (d.weekday == 7) {
                                  dimancheX = dimancheX + e["prix"];
                                  di.value = di.value + e["prix"];
                                }
                              }
                            });
                            //
                            return Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${d.day}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    color: Colors.indigo.shade200,
                                    alignment: Alignment.center,
                                    child: Jour(
                                        prix,
                                        lundiX,
                                        mardiX,
                                        mercrediX,
                                        jeudiX,
                                        vendrediX,
                                        samediX,
                                        dimancheX,
                                        totalX), //
                                    // child: FutureBuilder(
                                    //   future: controller.getAllCouresHistorique2(
                                    //       "${d.day}-${d.month}-${d.year}"),
                                    //   builder: (BuildContext context,
                                    //       AsyncSnapshot<List<dynamic>> snapshot) {
                                    //     if (snapshot.hasData) {
                                    //       List l = snapshot.data as List;
                                    //       double prix = 0;
                                    //       l.forEach((e) {
                                    //         prix += e["prix"];
                                    //         //
                                    //         totalX.value = totalX.value + e["prix"];
                                    //         //
                                    //         if (d.weekday == 1) {
                                    //           lundiX.value =
                                    //               lundiX.value + e["prix"];
                                    //         } else if (d.weekday == 2) {
                                    //           mardiX.value =
                                    //               mardiX.value + e["prix"];
                                    //         } else if (d.weekday == 3) {
                                    //           mercrediX.value =
                                    //               mercrediX.value + e["prix"];
                                    //         } else if (d.weekday == 4) {
                                    //           jeudiX.value =
                                    //               jeudiX.value + e["prix"];
                                    //         } else if (d.weekday == 5) {
                                    //           vendrediX.value =
                                    //               vendrediX.value + e["prix"];
                                    //         } else if (d.weekday == 6) {
                                    //           samediX.value =
                                    //               samediX.value + e["prix"];
                                    //         } else if (d.weekday == 7) {
                                    //           dimancheX.value =
                                    //               dimancheX.value + e["prix"];
                                    //         }

                                    //         //
                                    //       });
                                    //       //
                                    //       //setState(() {});
                                    //       //
                                    //       return Text(
                                    //         "$prix",
                                    //         style: const TextStyle(
                                    //           fontWeight: FontWeight.w500,
                                    //           fontSize: 25,
                                    //         ),
                                    //       );
                                    //     } else if (snapshot.hasError) {
                                    //       return Container();
                                    //     }
                                    //     return const Center(
                                    //       child: SizedBox(
                                    //         height: 30,
                                    //         width: 30,
                                    //         child: CircularProgressIndicator(),
                                    //       ),
                                    //     );
                                    //   },
                                    // ),
                                    // child: Text(
                                    //   "${13000 * index} CDF",
                                    //   style: const TextStyle(
                                    //     fontWeight: FontWeight.w500,
                                    //     fontSize: 20,
                                    //   ),
                                    // ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.indigo.shade100,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "CDF",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: Get.size.height / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Lundi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${lu.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Mardi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${ma.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Mercredi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${me.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Jeudi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${je.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Vendredi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${ve.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Samedi",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${sa.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Dimanche",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${di.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  //padding: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  width: double.maxFinite,
                                  color: Colors.indigo.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Total",
                                          style: ts2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "${tx.value} CDF",
                                          style: ts1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  onEmpty: Container(),
                  onLoading: const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                // child: Padding(
                //   padding: EdgeInsets.all(10),
                //   child: controller.obx(
                //     (state) {
                //       List l = state!;
                //       return Column(
                //         children: List.generate(
                //           l.length,
                //           (index) {
                //             Map e = l[index];
                //             return CourseItem(e);
                //           },
                //         ),
                //       );
                //     },
                //     onEmpty: Container(),
                //     onLoading: Center(
                //       child: SizedBox(
                //         height: 40,
                //         width: 40,
                //         child: CircularProgressIndicator(),
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle ts1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  TextStyle ts2 = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
}
