import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kenda_admin/widgets/course_item.dart';
import 'historique_controller.dart';
import 'package:get/get.dart';

class Historique extends GetView<HistoriqueController> {
  RxInt mois = 1.obs;
  TextEditingController annee = TextEditingController();
  Historique() {
    DateTime d = DateTime.now();
    annee.text = "${d.year}";
    mois.value = d.month;
    //
    controller.getAllCouresHistorique(mois.value, d.year);
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
              "Historique de vos courses",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: ListView(
            children: [
              Container(
                height: 100,
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
                                          print(e);
                                          mois.value = e!;

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
                                  child: TextField(
                                    controller: annee,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(hintText: "Annéé"),
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
                                      try {
                                        controller.getAllCouresHistorique(
                                            mois.value, int.parse(annee.text));
                                      } catch (e) {
                                        Get.snackbar("Erreur",
                                            "Veuillez entrer une bonne année.");
                                      }
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
              Padding(
                padding: EdgeInsets.all(10),
                child: controller.obx(
                  (state) {
                    List l = state!;
                    return Column(
                      children: List.generate(
                        l.length,
                        (index) {
                          Map e = l[index];
                          return CourseItem(e);
                        },
                      ),
                    );
                  },
                  onEmpty: Container(),
                  onLoading: Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
