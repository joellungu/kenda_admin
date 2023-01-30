import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/course_controller.dart';
import 'package:kenda_admin/pages/course/detail.dart';
import 'package:kenda_admin/pages/course/infos.dart';
import 'package:kenda_admin/pages/course/reservation.dart';
import 'package:kenda_admin/widgets/radial.dart';
import 'infos_supplementaire.dart';
import 'nouvelle_course/nouvelle_cours.dart';

class Course extends GetView<CourseController> {
  //List<PieChartData> l = [PieChartData(Colors.indigo.shade900, 35)];
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
                  child: Column(
                    children: List.generate(
                      7,
                      (index) {
                        return CourseItem({
                          "heureDepart": "2023-01-10 18:00:00.547888",
                          "heureArrive": "2023-01-10 20:00:00.547888",
                        });
                      },
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
                  onPressed: () {},
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

class CourseItem extends StatefulWidget {
  Map data;
  CourseItem(this.data) {
    print(DateTime.now());
  }
  @override
  State<StatefulWidget> createState() {
    return _CourseItem();
  }
}

class _CourseItem extends State<CourseItem> {
  double equation() {
    var totalMinute = DateTime.parse(widget.data["heureArrive"])
        .difference(DateTime.parse(widget.data["heureDepart"]))
        .inMinutes;
    var d = 360 / totalMinute;
    var minuteRestante = DateTime.parse(widget.data["heureArrive"])
        .difference(DateTime.now())
        .inMinutes;
    return minuteRestante * d;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //
        Get.to(Detail());
        //
      },
      leading: PieChart(
        data: PieChartData(Colors.indigo.shade900, equation()),
        radius: 17,
        //child: Text("Salut"),
      ),
      //const Icon(CupertinoIcons.doc_append),
      title: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Kinshasa",
              style: TextStyle(
                //fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade900,
              ),
            ),
            // color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 10,
              right: 10,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_forward,
                size: 13,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.green,
            child: Text(
              "Matadi",
              style: TextStyle(
                //fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "18h00",
              style: TextStyle(
                  //fontSize: 17,
                  ),
            ),
            // color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 10,
              right: 10,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_forward,
                size: 13,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.green,
            child: Text(
              "20h00",
              style: TextStyle(
                  //fontSize: 17,
                  ),
            ),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
