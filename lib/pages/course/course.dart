import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/course_controller.dart';
import 'package:kenda_admin/pages/course/detail.dart';
import 'package:kenda_admin/widgets/course_item.dart';
import 'historiques/historique.dart';
import 'nouvelle_course/nouvelle_cours.dart';

class Course extends GetView<CourseController> {
  //List<PieChartData> l = [PieChartData(Colors.indigo.shade900, 35)];
  Course() {
    controller.getAllCoures();
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
                "Vos courses",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.indigo.shade900,
            ),
            body: ListView(
              children: [
                Container(
                  height: 30,
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
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Feuilles de route des courses"),
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
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  tooltip: "",
                  heroTag: "history",
                  onPressed: () {
                    Get.to(Historique());
                  },
                  backgroundColor: Colors.indigo.shade900,
                  child: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  tooltip: "",
                  heroTag: "add",
                  onPressed: () {
                    Get.to(NouvelleCours());
                  },
                  backgroundColor: Colors.indigo.shade900,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
