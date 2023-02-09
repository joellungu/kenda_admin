import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

import 'itinerance_controller.dart';
import 'itinerance_details.dart';
import 'lieu.dart';
import 'nouvelle_itinerance.dart';

class Itenerance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Itenerance();
  }
}

class _Itenerance extends State<Itenerance> {
  RxList categorie = [].obs;
  double top = 0.0;
  double y = -1.5;
  double y1 = -1.5;
  double y2 = -1;
  //
  RxBool renverser = false.obs;
  //
  String jour = "", mois = "", annee = "";
  //
  String nombreP = '1';

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  //
  ItineranceController itineranceController = Get.find();

  @override
  Widget build(BuildContext context) {
    //
    var box = GetStorage();
    List liste = box.read("Itinerance") ?? [];
    //
    return Container(
      color: Colors.indigo.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //backgroundColor: Colors.grey.shade150,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.indigo.shade900,
                onStretchTrigger: () {
                  print("Le truc strck");
                  return Future.value();
                },
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: Get.size.height / 3.5,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 2,
                  background: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    //
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Container(
                                          height: 120,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              ListTile(
                                                leading: Icon(Icons
                                                    .help_outline_outlined),
                                                title: Text("Aide et FAQ"),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                    CupertinoIcons.info_circle),
                                                title: Text(
                                                    "À propos de l'application"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    //showModalBottomSheet(context: context, builder: builder)
                                    // showBottomSheet(
                                    //   context: context,
                                    //   builder: (c) {
                                    //     return SizedBox(
                                    //       height: 100,
                                    //       child: Column(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.center,
                                    //         children: const [
                                    //           ListTile(
                                    //             leading: Icon(Icons
                                    //                 .help_outline_outlined),
                                    //             title:
                                    //                 Text("Aide et FAQ"),
                                    //           ),
                                    //           ListTile(
                                    //             leading: Icon(
                                    //                 CupertinoIcons
                                    //                     .info_circle),
                                    //             title: Text(
                                    //                 "À propos de l'application"),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  icon: const Icon(
                                    Icons.help,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "Vos itinerances",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //
                                  },
                                  icon: Icon(
                                    Icons.help,
                                    color: Colors.indigo.shade900,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //
                                showSimpleModal(Lieu(0), context);
                                //
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.indigo.shade800,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: SizedBox(
                                width: Get.size.width / 1.2,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Obx(
                                        () => Text(
                                          renverser.value
                                              ? "Arrivée"
                                              : "Départ",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => Text(
                                              renverser.value
                                                  ? itineranceController
                                                      .arrive.value
                                                  : itineranceController
                                                      .depart.value,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showSimpleModal(Lieu(1), context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.indigo.shade800,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: SizedBox(
                                width: Get.size.width / 1.2,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Obx(
                                        () => Text(
                                          renverser.value
                                              ? "Départ"
                                              : "Arrivée",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => Text(
                                              renverser.value
                                                  ? itineranceController
                                                      .depart.value
                                                  : itineranceController
                                                      .arrive.value,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recherches",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      //
                                    },
                                    icon: Icon(
                                      Icons.help,
                                      color: Colors.indigo.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              renverser.value = renverser.value ? false : true;
                            },
                            child: Container(
                              height: 32,
                              width: 32,
                              // foregroundDecoration: BoxDecoration(
                              //   color: Colors.yellow,
                              //   borderRadius: BorderRadius.circular(16),
                              // ),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade900,
                                border: Border.all(
                                  color: Colors.indigo.shade700,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: RotatedBox(
                                quarterTurns: 45,
                                child: Icon(
                                  Icons.sync,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              //color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  centerTitle: false,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //Get.to(Resultat({}));
                          if (itineranceController.depart.value.isNotEmpty &&
                              itineranceController.arrive.value.isNotEmpty) {
                            //
                            ItineranceController itineranceController =
                                Get.find();
                            //
                            Get.dialog(Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(),
                              ),
                            ));
                            List l = await itineranceController.getItinerance(
                              itineranceController.depart.value,
                              itineranceController.arrive.value,
                            );
                            //
                            Get.back();
                            //
                            if (l.isNotEmpty) {
                              Get.to(
                                NouvelleItinerance(
                                  l,
                                  {
                                    "depart": itineranceController.depart.value,
                                    "arrive": itineranceController.arrive.value,
                                  },
                                  this,
                                ),
                              );
                            } else {
                              Get.snackbar(
                                  "Vide", "Pas d'itinerance pour le moment.");
                            }

                            //
                          } else {
                            //
                            Get.snackbar(
                              "Attention",
                              "Veuillez selectionner le lieu de départ et d'arrivé.",
                              colorText: Colors.white,
                              snackStyle: SnackStyle.GROUNDED,
                            );
                            //
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.green.shade700,
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          width: Get.size.width / 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Liste d'itineraires",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        //
                        Get.to(ItineranceDetails(liste[index], index, this));
                        //
                      },
                      leading: Icon(Icons.directions_walk),
                      //const Icon(CupertinoIcons.doc_append),
                      title: Text("${liste[index]['titre']}"),
                      subtitle: Text("Arrets ${liste[index]['liste'].length}"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    );
                  },
                  childCount: liste.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  showSimpleModal(Widget vue, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (c) {
        return Container(
          height: Get.size.height / 1.05,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 10,
                child: Container(
                  height: 7,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: vue,
              )
            ],
          ),
        );
      },
    );
  }
}
