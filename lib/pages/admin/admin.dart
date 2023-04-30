import 'package:flutter/material.dart';

import 'recherche.dart';

class Admin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Admin();
  }
}

class _Admin extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        print(constraints.maxHeight);
        print(constraints.maxWidth);

        if (constraints.maxWidth > 700) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                "Admin",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.indigo.shade900,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Recherche(),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                "Admin",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.indigo.shade900,
            ),
            drawer: Drawer(
              elevation: 1,
              child: Recherche(),
            ),
            body: Container(
              color: Colors.red,
            ),
          );
        }
      }),
    );
  }
}
