import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenda_admin/pages/agents/agent.dart';
import 'package:kenda_admin/pages/bus/bus.dart';
import 'package:kenda_admin/pages/course/course.dart';
import 'package:kenda_admin/pages/course/itinerance/itinerance.dart';
import 'package:kenda_admin/pages/course/rapports/rapport.dart';
import '../regularisation/regularisation.dart';

class AccueilAdmin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccueilAdmin();
  }
}

class _AccueilAdmin extends State<AccueilAdmin> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: page == 0
          ? Course()
          : page == 1
              ? Itenerance()
              : page == 2
                  ? Bus()
                  : Agent(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          //
          setState(() {
            page = e;
          });
        },
        currentIndex: page,
        selectedItemColor: Colors.indigo.shade900,
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar_badge_plus),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location),
            label: "Plus",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bus),
            label: "Bus",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Agents",
          ),
        ],
      ),
    );
  }
}
