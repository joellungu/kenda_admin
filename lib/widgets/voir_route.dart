import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/course/itinerance/itinerance_controller.dart';

class VoirRoute extends StatelessWidget {
  //
  ItineranceController itineranceController = Get.find();
  //
  List rs = ["RN1", "RN2", "RN5", "RN7", "RN9", "RN12"];
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: List.generate(
          rs.length,
          (index) => ListTile(
            title: Text(
              "${rs[index]}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              //
              itineranceController.route.value = rs[index];
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
