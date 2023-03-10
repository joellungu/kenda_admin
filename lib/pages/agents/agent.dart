import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kenda_admin/pages/agents/nouvel_agent.dart';
import 'package:kenda_admin/widgets/loader.dart';
import 'package:kenda_admin/widgets/modal.dart';
import 'agent_controller.dart';
import 'details_agent.dart';

class Agent extends GetView<AgentController> {
  Agent() {
    controller.load(1);
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
                backgroundColor: Colors.indigo.shade900,
              ),
              body: ListView(
                children: List.generate(l.length, (index) {
                  Map e = l[index];
                  return ListTile(
                    onTap: () {
                      //
                      showSimpleModal(DetailsAgent(e), context);
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
