import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoSupplementaire extends StatelessWidget {
  Map? details;
  InfoSupplementaire({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    //
                    Get.back();
                    //
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Informations supplémentaire",
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),

                //                           Text(
                //   "Info trajet",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //
                        //Get.back();
                        //
                      },
                      icon: const Icon(
                        CupertinoIcons.bus,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Transco Métro\n",
                        children: [
                          TextSpan(
                            text: "vers Boma",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("LOGO")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Equipage",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.profile_circled),
                        title: const Text("Mr. Jean Didie Mangombe"),
                        subtitle: const Text("Chauffeur"),
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.profile_circled),
                        title: const Text("Evariste Mwamba"),
                        subtitle: const Text("Receptionniste"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          "Info. Bus",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.safety_divider),
                        title: const Text("Nombre de places"),
                        subtitle: const Text("50"),
                      ),
                      ListTile(
                        leading:
                        const Icon(CupertinoIcons.thermometer_snowflake),
                        title: const Text("Climatisé"),
                        //subtitle: const Text("Receptionniste"),
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.gauge),
                        title: const Text("Vitesse max"),
                        subtitle: const Text("250 Km/h"),
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.wrench_fill),
                        title: const Text("Dernière entretien"),
                        subtitle: const Text("12 déc 2022"),
                      ),
                      Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
