import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/agents/nouvel_agent.dart';
import 'package:kenda_admin/widgets/loader.dart';
import 'package:kenda_admin/widgets/modal.dart';
import 'agent_controller.dart';
import 'details_admin.dart';
import 'details_agent.dart';

class Agent extends GetView<AgentController> {
  var box = GetStorage();
  bool admin;
  Agent(this.admin) {
    var box = GetStorage();
    //
    Map e = box.read("user");
    controller.load(e['idPartenaire']);
    print("-------------------:: $admin");
    //controller.load(1);
  }
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List l = state!;
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
                  "Vos agents",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // actions: [
                //   admin
                //       ? IconButton(
                //           onPressed: () {
                //             Map user = box.read("user");
                //             print(user);
                //             if (user["role"] == 5) {
                //               showSimpleModal(
                //                   DetailsAgent(user, false), context);
                //             } else {
                //               showSimpleModal(DetailsAdmin(user), context);
                //             }
                //           },
                //           icon: const Icon(
                //             CupertinoIcons.person,
                //             color: Colors.white,
                //           ),
                //         )
                //       : const SizedBox(
                //           height: 0,
                //           width: 0,
                //         ),
                // ],
                backgroundColor: Colors.indigo.shade900,
              ),
              body: ListView(
                children: List.generate(l.length, (index) {
                  Map e = l[index];
                  Map user = box.read("user") ?? {};
                  // if (user['role'] == 5) {
                  //   if (e["role"] != 5) {
                  //     return ListTile(
                  //       onTap: () {
                  //         //
                  //         showSimpleModal(DetailsAgent(e, false), context);
                  //         //
                  //       },
                  //       leading: const Icon(
                  //         CupertinoIcons.person,
                  //         size: 40,
                  //       ),
                  //       title: Text(
                  //         "${e['nom']} ${e['postnom']} ${e['prenom']}",
                  //         style: TextStyle(
                  //           //fontSize: 17,
                  //           fontWeight: FontWeight.w900,
                  //           color: Colors.grey.shade900,
                  //         ),
                  //       ),
                  //       subtitle: Text(
                  //         "${e['roletitre']}",
                  //         style: TextStyle(
                  //           //fontSize: 17,
                  //           fontWeight: FontWeight.w900,
                  //           color: Colors.grey.shade900,
                  //         ),
                  //       ),
                  //       trailing: e['actif']
                  //           ? Icon(
                  //               Icons.check,
                  //               color: Colors.green.shade900,
                  //               size: 15,
                  //             )
                  //           : Icon(
                  //               Icons.close,
                  //               color: Colors.red.shade900,
                  //               size: 15,
                  //             ),
                  //     );
                  //   } else {
                  //     return Container();
                  //   }
                  // }
                  if (e["roletitre"] == "Admin") {
                    return Container();
                  } else {
                    return ListTile(
                      onTap: () {
                        //
                        showSimpleModal(DetailsAgent(e, true), context);
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
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      trailing: e['actif']
                          ? Icon(
                              Icons.check,
                              color: Colors.green.shade900,
                              size: 15,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.red.shade900,
                              size: 15,
                            ),
                    );
                  }
                }),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.to(FormulaireAgent());
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
                Get.to(FormulaireAgent());
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
