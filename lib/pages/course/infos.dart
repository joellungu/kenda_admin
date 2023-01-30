import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/widgets/dessin.dart';

class Infos extends StatefulWidget {
  Map details;
  Infos(this.details);
  //
  @override
  State<StatefulWidget> createState() {
    return _Infos();
  }
}

class _Infos extends State<Infos> {
  //
  //String nom = randomAlphaNumeric(10);
  //
  //LieuController lieuController = Get.find();
  //
  var channel;
  @override
  void initState() {
    /*
    channel = WebSocketChannel.connect(
      Uri.parse('ws://${Connexion.url}/recherchelieu/$nom'),
    );
    */
    super.initState();
    //
  }

  //
  @override
  void dispose() {
    //
    //channel.sink.close();
    //
    super.dispose();
    //
  }

  //
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
                  text: "Info trajet\n",
                  children: [
                    TextSpan(
                      text: "2h 30m",
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
            padding: const EdgeInsets.only(top: 20),
            children: [
              Trajectoire(),
              Trajectoire(),
            ],
          ),
        )
      ]),
    );
  }
}

class Trajectoire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Trajectoire();
  }
}

class _Trajectoire extends State<Trajectoire> {
  double v = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        setState(() {
          v = 120;
        });
      },
      child: SizedBox(
        height: 120,
        width: Get.size.width,
        //color: Colors.green,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              width: 50,
              child: ClipPath(
                clipper: OsIcons(),
                child: Container(
                  height: 120,
                  width: 50,
                  color: Colors.grey,
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    height: v,
                    width: 50,
                    color: Colors.green.shade700,
                    duration: const Duration(seconds: 3),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, top: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "15h:30",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "comment tu vas ?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "19h:30",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "comment tu vas ?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
