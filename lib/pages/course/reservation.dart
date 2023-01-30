import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'carte_bus.dart';

class Reservation extends StatelessWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
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
                  text: "Emplacement dans le bus\n",
                  children: [
                    TextSpan(
                      text: "2 Places selectionnables",
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
          child: CarteBus(),
        ),
      ]),
    );
  }
}
