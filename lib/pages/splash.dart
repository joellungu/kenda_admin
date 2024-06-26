import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/accueil/accueil.dart';
import 'package:kenda_admin/pages/accueil/accueil_admin.dart';
import 'package:kenda_admin/pages/application/application_controller.dart';
import 'package:flutter/material.dart';
import 'package:kenda_admin/widgets/radial.dart';
import 'admin/admin.dart';
import 'agents/agent_controller.dart';
import 'application/application.dart';
import 'bus/bus_controller.dart';
import 'course/course_controller.dart';
import 'course/historiques/historique_controller.dart';
import 'course/itinerance/itinerance_controller.dart';
import 'course/itinerance/lieu_controller.dart';
import 'course/nouvelle_course/nouvelle_course_controller.dart';
import 'course/rapports/rapport_controller.dart';
import 'course/rapports/reservation_controller.dart';
import 'login/login.dart';
import 'login/login_controller.dart';
import 'profile/profile_controller.dart';

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
  RapportController rapportController = Get.put(RapportController());
  LoginController loginController = Get.put(LoginController());
  //
  ProfileController profileController = Get.put(ProfileController());
  //
  ReservationController reservationController =
      Get.put(ReservationController());
  //
  Splash() {
    Timer(const Duration(seconds: 3), () {
      //
      var box = GetStorage();
      //
      Map e = box.read("user") ?? {};

      //
      Get.off(Login());
      //
      // if (e['id'] != null) {
      //   //
      //   String type = box.read("type") ?? "";
      //   //
      //   if (type == "admin") {
      //     Get.off(AccueilAdmin());
      //   } else {
      //     Get.off(Accueil());
      //   }
      // } else {
      //   Get.off(Login());
      // }

      //Get.off(Application());
      //Get.off(Admin());
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
