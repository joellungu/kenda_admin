import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kenda_admin/pages/course/itinerance/lieu_controller.dart';
import 'package:kenda_admin/utils/requetes.dart';
import 'package:random_string/random_string.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'itinerance_controller.dart';

class Lieu extends StatefulWidget {
  int c = 0;
  Lieu(this.c);
  //
  @override
  State<StatefulWidget> createState() {
    return _Lieu();
  }
}

class _Lieu extends State<Lieu> {
  //
  String nom = randomAlphaNumeric(10);
  //
  LieuController lieuController = Get.find();
  ItineranceController itineranceController = Get.find();
  //
  var channel;
  @override
  void initState() {
    //
    channel = WebSocketChannel.connect(
      Uri.parse('${Requete.ws}/recherchelieu/$nom'),
    );
    //
    super.initState();
    //
  }

  //
  @override
  void dispose() {
    //
    channel.sink.close();
    //
    super.dispose();
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              widget.c == 0
                  ? const Text(
                      "Lieu de départ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      "Lieu d'arrivée",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Icon(
                Icons.help,
                color: Colors.white,
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    autofocus: true,
                    onChanged: (t) {
                      //
                      channel.sink.add(t);
                      //
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: StreamBuilder(
                    stream: channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        String r = snapshot.data as String;
                        List lieux = jsonDecode(r); //snapshot.data
                        return ListView(
                          children: List.generate(lieux.length, (index) {
                            return ListTile(
                              onTap: () {
                                //
                                if (widget.c == 0) {
                                  itineranceController.depart.value =
                                      "${lieux[index]}";
                                } else {
                                  itineranceController.arrive.value =
                                      "${lieux[index]}";
                                }
                                //
                                Get.back();
                              },
                              leading: const Icon(Icons.map_sharp),
                              title: Text("${lieux[index]}"),
                            );
                          }),
                        );
                      } else {
                        print(snapshot.error);
                        return Container();
                      }
                      // return Text(
                      //     snapshot.hasData ? '${snapshot.data}' : '');
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
