import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'itinerance_controller.dart';
import 'nouvelle_itinerance.dart';

class RouteNationale extends GetView<ItineranceController> {
  //
  String route;
  RxList its = [].obs;
  State? st;
  //
  RxString ac = "".obs;
  int ac_ = 0;
  RxString rc = "".obs;
  int rc_ = 0;
  //
  List l = [];
  List listeFinale = [];
  //
  RouteNationale(this.route, this.st) {
    controller.getAllRouteBy(route);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Route Nationale $route",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: controller.obx(
        (state) {
          //
          List liste = state!;
          l = state;
          //
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                          const Expanded(
                            flex: 5,
                            child: Text(
                              "Routes",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "A",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "R",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: List.generate(liste.length, (index) {
                          //
                          Map e = liste[index];
                          //RxInt c1 = (-1).obs;
                          //RxBool c2 = false.obs;
                          //
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              e["principale"]
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "${e['nom']}",
                                  style: TextStyle(
                                    fontSize: e["principale"] ? 17 : 15,
                                    fontWeight: e["principale"]
                                        ? FontWeight.w700
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Obx(() => Radio(
                                              value: "${index}A",
                                              groupValue: ac.value,
                                              onChanged: (e) {
                                                print(e);
                                                print("$e".split("A")[0]);
                                                ac_ = int.parse(
                                                    "$e".split("A")[0]);
                                                //c1.value = !c1.value;
                                                ac.value = e as String;
                                                //index = e ;
                                                //
                                                //choix1["index"] = "${index}A";
                                                //
                                              },
                                            )
                                        // () => Checkbox(
                                        //   value: choix1["index"] == ac,
                                        //   onChanged: (e) {
                                        //     print(e);
                                        //     //
                                        //     c1.value = !c1.value;
                                        //     //
                                        //     choix1["index"] = "${index}A";
                                        //     //
                                        //   },
                                        // ),
                                        ),
                                    Obx(
                                      () => Radio(
                                        value: "${index}R",
                                        groupValue: rc.value,
                                        onChanged: (e) {
                                          print(e);
                                          print("$e".split("R")[0]);
                                          rc_ = int.parse("$e".split("R")[0]);
                                          rc.value = e as String;
                                          //index = e ;
                                          //
                                          //choix1["index"] = "${index}A";
                                          //
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          //getAller/getRetour
                          print("$ac_ > $rc_ == ${ac_ > rc_}");
                          if (ac_ > rc_) {
                            //
                            getAller(ac_, rc_);
                          } else {
                            //
                            getRetour(ac_, rc_);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: const SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Tracer",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Obx(
                  () => its.isNotEmpty
                      ? NouvelleItinerance(
                          its.value,
                          {"depart": l[ac_]["nom"], "arrive": l[rc_]["nom"]},
                          st!,
                        )
                      : Container(),
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
    );
  }

  getAller(int d, int a) {
    listeFinale.clear();
    for (int i = d; a <= i; a++) {
      listeFinale.add(l[a]);
    }
    //print("getAller: $listeFinale");
    getProbabilite();
  }

  //
  getRetour(int d, int a) {
    listeFinale.clear();
    for (int i = a; i >= d; i--) {
      listeFinale.add(l[i]);
    }
    //print("getRetour: $listeFinale");
    getProbabilite();
  }

  //
  getProbabilite() {
    //
    listeFinale.forEach((i) {
      //
      listeFinale.forEach((e) {
        //
        if (i['nom'] != e['nom']) {
          its.add(
            {
              "adLieu": i['nom'],
              "aaLieu": e['nom'],
              "active": false,
            },
          );
        }
      });
    });
    print(its);
  }
}
