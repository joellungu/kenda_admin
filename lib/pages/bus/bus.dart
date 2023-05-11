import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/bus/bus_controller.dart';
import 'package:kenda_admin/utils/requetes.dart';
import 'package:kenda_admin/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:kenda_admin/widgets/modal.dart';

import 'details_bus.dart';
import 'nouveau_bus.dart';

class Bus extends GetView<BusController> {
  //
  Requete requete = Requete();
  //
  Bus() {
    var box = GetStorage();
    //
    Map e = box.read("user");
    controller.load(e['id']);
  }
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
        print(l);

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
                  "Vos bus",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.indigo.shade900,
              ),
              body: ListView(
                children: List.generate(l.length, (index) {
                  Map e = l[index];
                  return ListTile(
                    onTap: () {
                      //
                      showSimpleModal(DetailsBus(e), context);
                      //
                    },
                    leading: e['logo'] != null
                        ? Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${Requete.url}/bus/bus.png?id=${e['id']}"),
                              ),
                            ),
                          )
                        : const Icon(
                            CupertinoIcons.bus,
                            size: 40,
                          ),
                    title: Text(
                      "${e['marque']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${e['type']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        //color: Colors.grey.shade900,
                      ),
                    ),
                    trailing: e['climatisation']
                        ? Icon(
                            CupertinoIcons.thermometer_snowflake,
                            color: Colors.green.shade900,
                            size: 15,
                          )
                        : Icon(
                            Icons.hot_tub,
                            color: Colors.red.shade900,
                            size: 15,
                          ),
                  );
                }),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.to(FormulaireBus());
                },
                backgroundColor: Colors.indigo.shade900,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
      onEmpty: Container(
        color: Colors.indigo.shade900,
        child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                "Vos agents",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.indigo.shade900,
            ),
            body: const Center(
              child: Text("Vide"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(FormulaireBus());
              },
              backgroundColor: Colors.indigo.shade900,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onError: (e) {
        return Container();
      },
      onLoading: Loader(),
    );
  }
}
