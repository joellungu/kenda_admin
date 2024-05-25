import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final numero = TextEditingController();
  final mdp = TextEditingController();

  LoginController loginController = Get.find();
  //
  RxBool masquer = true.obs;
  //
  RxBool vue = true.obs;
  //
  RxString choix = "admin".obs;
  RxString agent = "Agent".obs;
  RxString admin = "Admin".obs;

  //
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black, // Status bar color
        child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Container(
                  width: 400,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              //color: Colors.amber,
                              image: DecorationImage(
                                image: ExactAssetImage("assets/AiYA.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Image.asset(
                          //   "assets/logo_MIN SANTE.png",
                          //   width: 300,
                          //   height: 300,
                          // ),
                          const SizedBox(
                            height: 70,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Connecte toi pour commencer le travail.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          TextFormField(
                            controller: numero,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Veuilliez inserer votre nom d'utilisateur ou votre numéro";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.person),
                                hintText: "Nom d'utilisateur",
                                prefixText: "+243 "),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: mdp,
                              obscureText: masquer.value,
                              validator: (e) {
                                if (e!.isEmpty) {
                                  return "Veuilliez inserer votre mot de passe";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: Obx(
                                  () => IconButton(
                                    icon: vue.value
                                        ? Icon(Icons.lock)
                                        : Icon(Icons.lock),
                                    onPressed: () {
                                      //
                                      masquer.value = !masquer.value;
                                    },
                                  ),
                                ),
                                hintText: "Mot de passe",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //if (formKey.currentState!.validate()) {
                              //Get.off(Accueil());

                              Get.dialog(
                                Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                              );

                              if (true) {
                                //choix.value == "admin"
                                print("-------------------:: admin");
                                loginController.loagingAdmin(
                                    "243${numero.text}", mdp.text);
                              }
                              // appController.loagingAgent(
                              //     "243${numero.text}", mdp.text);
                              //Get.offAll(Accueil());
                              // Timer(Duration(seconds: 3), () {
                              //   Get.back();
                              //   Get.off(Accueil());
                              // });
                              // Map e = {
                              //   "pseudo": numero.text,
                              //   "pwd": mdp.text,
                              // };
                              //appController.login(e);
                              //loginController.deja.value = true;
                              //}
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                const Size(
                                  double.maxFinite,
                                  45,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade900),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              child: const Text(
                                "S'authentifier",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // OutlinedButton(
                          //   onPressed: () {
                          //     //
                          //     //Get.to(MdpOublie());
                          //   },
                          //   style: ButtonStyle(
                          //     fixedSize: MaterialStateProperty.all(
                          //       Size(
                          //         double.maxFinite,
                          //         45,
                          //       ),
                          //     ),
                          //     shape:
                          //         MaterialStateProperty.all(RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(20),
                          //     )),
                          //     //backgroundColor:
                          //     //  MaterialStateProperty.all(Colors.red.shade900),
                          //   ),
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     width: double.maxFinite,
                          //     child: const Text(
                          //       "Mot de passe oublié",
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      //)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
