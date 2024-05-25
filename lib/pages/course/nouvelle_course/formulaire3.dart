import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/bus/bus_controller.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/nouvelle_cours.dart';
import 'package:kenda_admin/utils/requetes.dart';
import 'package:kenda_admin/widgets/loader.dart';

class Buss extends GetView<BusController> {
  Buss() {
    //
    var box = GetStorage();
    //
    Map e = box.read("user");
    controller.load(e['idPartenaire']);
  }
  //
  RxInt i = (-1).obs;

  //
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
        return Obx(
          () => ListView(
            children: [
              bus["id"] != null
                  ? ListTile(
                      leading: bus['logo'] != null
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${Requete.url}/bus/bus.png?id=${bus['id']}"),
                                ),
                              ),
                            )
                          : const Icon(
                              CupertinoIcons.bus,
                              size: 40,
                            ),
                      title: Text(
                        "${bus['marque']}",
                        style: TextStyle(
                          //fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      subtitle: Text(
                        "${bus['type']}",
                        style: const TextStyle(
                          //fontSize: 17,
                          fontWeight: FontWeight.w900,
                          //color: Colors.grey.shade900,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade700,
                          size: 30,
                        ),
                        onPressed: () {
                          //
                          bus.value = {};
                          //
                        },
                      ),
                    )
                  : Container(),
              Container(
                height: 3,
                color: Colors.black,
              ),
              Column(
                children: List.generate(l.length, (index) {
                  Map e = l[index];
                  return ListTile(
                    onTap: () {
                      //
                      i.value = index;
                      bus.value = e;
                      //print(e);
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
                      style: const TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        //color: Colors.grey.shade900,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        );
      },
      onEmpty: Container(
          //color: Colors.indigo.shade900,
          ),
      onError: (e) {
        return Container();
      },
      onLoading: Loader(),
    );
  }
}
