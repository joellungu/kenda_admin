import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance_controller.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/nouvelle_cours.dart';

class It extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _It();
  }
}

class _It extends State<It> {
  List liste = [];
  ItineranceController itineranceController = Get.find();
  //List liste = []; //box.read("Itinerance") ?? [];
  getIts() async {
    liste = await itineranceController.getAllItinerancesSave();
    liste.forEach((element) {
      itineranceController.listeResumer.add(element['nom']);
    });
  }

  RxInt i = (-1).obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    getIts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: [
      itinerance.isNotEmpty
          ? ListTile(
              leading: const Icon(
                Icons.check,
                color: Colors.green,
                size: 30,
              ),
              //const Icon(CupertinoIcons.doc_append),
              title: Text(
                itinerance.value,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade900,
                ),
              ),
              //subtitle: Text("Arrets ${itinerance['liste'].length}"),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red.shade700,
                  size: 30,
                ),
                onPressed: () {
                  //
                  setState(() {
                    itinerance.value = "";
                  });
                  //
                },
              ),
            )
          : Container(),
      Container(
        height: 3,
        color: Colors.black,
      ),
      Obx(
        () => Column(
          children:
              List.generate(itineranceController.listeResumer.length, (index) {
            //Map e = liste[index];
            return ListTile(
              onTap: () {
                //
                setState(() {
                  itinerance.value =
                      "${itineranceController.listeResumer.elementAt(index)}";
                });
                //
                //
              },

              //const Icon(CupertinoIcons.doc_append),
              title: Text(
                "${itineranceController.listeResumer.elementAt(index)}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade900,
                ),
              ),
              //subtitle: Text("Arrets ${liste[index]['liste'].length}"),
            );
          }),
        ),
      ),
    ]);
  }
}
