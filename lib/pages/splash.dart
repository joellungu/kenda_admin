import 'dart:async';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/application/application_controller.dart';
import 'package:flutter/material.dart';
import 'package:kenda_admin/widgets/radial.dart';
import 'agents/agent_controller.dart';
import 'application/application.dart';
import 'bus/bus_controller.dart';
import 'course/course_controller.dart';
import 'course/historiques/historique_controller.dart';
import 'course/itinerance/itinerance_controller.dart';
import 'course/itinerance/lieu_controller.dart';
import 'course/nouvelle_course/nouvelle_course_controller.dart';

class Splash extends StatelessWidget {
  //
  ApplicationController applicationController =
      Get.put(ApplicationController());
  BusController busController = Get.put(BusController());
  AgentController agentController = Get.put(AgentController());
  ItineranceController itineranceController = Get.put(ItineranceController());
  LieuController lieuController = Get.put(LieuController());
  CourseController courseController = Get.put(CourseController());
  NouvelleCourseController nouvelleCourseController =
      Get.put(NouvelleCourseController());
  HistoriqueController historiqueController = Get.put(HistoriqueController());
  //
  Splash() {
    Timer(const Duration(seconds: 3), () {
      Get.off(Application());
      //Get.off(Radial());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("..."),
      ),
    );
  }
}
