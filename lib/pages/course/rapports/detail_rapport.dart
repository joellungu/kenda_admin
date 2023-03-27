import 'package:flutter/material.dart';

class DetailRapport extends StatelessWidget {
  Map e;
  DetailRapport(this.e);
  @override
  Widget build(BuildContext context) {
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
              "Détails apports",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Text.rich(
                TextSpan(
                  text: "Date: ",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900,
                  ),
                  children: [
                    TextSpan(
                      text: "${e['date']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(
              //   color: Colors.grey.shade300,
              // ),
              // Text.rich(
              //   TextSpan(
              //     text: "Titre: ",
              //     style: TextStyle(
              //       fontSize: 17,
              //       fontWeight: FontWeight.w900,
              //       color: Colors.grey.shade900,
              //     ),
              //     children: [
              //       TextSpan(
              //         text: "15-4-2023",
              //         style: TextStyle(
              //           fontSize: 17,
              //           fontWeight: FontWeight.normal,
              //           color: Colors.grey.shade900,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Text.rich(
                TextSpan(
                  text: "Objet: ",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900,
                  ),
                  children: [
                    TextSpan(
                      text: "${e['object']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              Text.rich(
                TextSpan(
                  text: "Contenu: ",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900,
                  ),
                  children: [
                    TextSpan(
                      text: "${e['contenue']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
