import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ItineranceDetails extends StatefulWidget {
  int index;
  Map e;
  State state;
  ItineranceDetails(this.e, this.index, this.state);
  @override
  State<StatefulWidget> createState() {
    return _ItineranceDetails();
  }
}

class _ItineranceDetails extends State<ItineranceDetails> {
  List ll = [];
  @override
  void initState() {
    //
    ll = widget.e['liste'];
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier ou Supprimer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
        bottom: PreferredSize(
          preferredSize: Size(100, 30),
          child: Container(
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
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("${widget.e['titre']}"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: List.generate(
              ll.length,
              (index) {
                Map e = ll[index];
                TextEditingController text =
                    TextEditingController(text: "${e['prix']}");
                return Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${e['arretDepart']['nom']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${e['arretArrive']['nom']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextField(
                            controller: text,
                            enabled: e['active'],
                            keyboardType: TextInputType.number,
                            onChanged: (tt) {
                              //
                              setState(() {
                                e['prix'] = tt;
                                //text.text = "${e['prix']}";
                              });
                            },
                            decoration: InputDecoration(
                              suffix: Text("CDF"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Switch(
                            onChanged: (s) {
                              setState(() {
                                e['active'] = s;
                              });
                            },
                            value: e['active'],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
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
                    var box = GetStorage();
                    List l = [];
                    Map r = {};
                    ll.forEach((e) {
                      if (e['active']) {
                        l.add(e);
                      }
                    });
                    r["titre"] = "${widget.e['titre']}";
                    r["liste"] = l;

                    List listeFinal = box.read("Itinerance") ?? [];
                    listeFinal.removeAt(widget.index);
                    listeFinal.add(r);

                    box.write("Itinerance", listeFinal);
                    Get.back();
                    Get.back();
                    Get.snackbar(
                      "Effectu??",
                      "Enregistrement ??ffectu?? avec succ??s",
                      colorText: Colors.white,
                      snackStyle: SnackStyle.GROUNDED,
                    );
                    widget.state.setState(() {});
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 0,
                      right: 0,
                      bottom: 2,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade900,
                        borderRadius: BorderRadius.circular(10),
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                        // ),
                      ),
                      child: Text(
                        "Modifier".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
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
                    var box = GetStorage();

                    List listeFinal = box.read("Itinerance") ?? [];
                    listeFinal.removeAt(widget.index);
                    //listeFinal.add(listeFinal);

                    box.write("Itinerance", listeFinal);
                    Get.back();
                    Get.back();
                    Get.snackbar(
                      "Effectu??",
                      "Enregistrement ??ffectu?? avec succ??s",
                      colorText: Colors.white,
                      snackStyle: SnackStyle.GROUNDED,
                    );
                    widget.state.setState(() {});
                    //
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 0,
                      right: 0,
                      bottom: 2,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(10),
                        // gradient: LinearGradient(
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                        // ),
                      ),
                      child: Text(
                        "Supprimer".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
