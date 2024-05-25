import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/agents/agent_controller.dart';
import 'package:kenda_admin/pages/course/nouvelle_course/nouvelle_cours.dart';
import 'package:kenda_admin/widgets/loader.dart';

class Equipage extends GetView<AgentController> {
  Equipage() {
    //
    var box = GetStorage();
    //
    Map e = box.read("user");
    controller.load(e['idPartenaire']);
    //controller.load(1);
  }

  //
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
        print(l);
        return ListView(children: [
          Obx(
            () => chauffeur["id"] != null
                ? ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${chauffeur['nom']} ${chauffeur['postnom']} ${chauffeur['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${chauffeur['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
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
                        chauffeur.value = {};
                        //
                      },
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => receveur["id"] != null
                ? ListTile(
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${receveur['nom']} ${receveur['postnom']} ${receveur['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${receveur['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
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
                        receveur.value = {};
                        //
                      },
                    ),
                  )
                : Container(),
          ),
          // Obx(
          //   () => embarqueur["id"] != null
          //       ? ListTile(
          //           leading: const Icon(
          //             CupertinoIcons.person,
          //             size: 40,
          //           ),
          //           title: Text(
          //             "${embarqueur['nom']} ${embarqueur['postnom']} ${embarqueur['prenom']}",
          //             style: TextStyle(
          //               //fontSize: 17,
          //               fontWeight: FontWeight.w900,
          //               color: Colors.grey.shade900,
          //             ),
          //           ),
          //           subtitle: Text(
          //             "${embarqueur['roletitre']}",
          //             style: TextStyle(
          //               //fontSize: 17,
          //               fontWeight: FontWeight.normal,
          //               color: Colors.grey.shade900,
          //             ),
          //           ),
          //           trailing: Icon(
          //             Icons.check,
          //             color: Colors.green,
          //             size: 30,
          //           ),
          //         )
          //       : Container(),
          // ),
          Container(
            height: 3,
            color: Colors.black,
          ),
          Column(
            children: List.generate(l.length, (index) {
              Map e = l[index];
              RxInt n = (-1).obs; //index.obs;
              print("Agent: $e");
              if (e['role'] != 0 && e['role'] != 3) {
                return Obx(
                  () => ListTile(
                    onTap: () {
                      print(e);
                      //
                      if (e['role'] == 1) {
                        chauffeur.value = e;
                      } else if (e['role'] == 2) {
                        receveur.value = e;
                      } else {
                        embarqueur.value = e;
                      }
                      print(n.value);
                      //
                    },
                    leading: const Icon(
                      CupertinoIcons.person,
                      size: 40,
                    ),
                    title: Text(
                      "${e['nom']} ${e['postnom']} ${e['prenom']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    subtitle: Text(
                      "${e['roletitre']}",
                      style: TextStyle(
                        //fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    trailing: n.value == index
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 30,
                          )
                        : Container(
                            height: 30,
                            width: 30,
                          ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          )
        ]);
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
