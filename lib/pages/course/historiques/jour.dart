import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'historique_controller.dart';

class Jour extends StatefulWidget {
  double prix;
  double total;
  double lu, ma, mer, jeu, ven, sa, dim;
  Jour(
    this.prix,
    this.lu,
    this.ma,
    this.mer,
    this.jeu,
    this.ven,
    this.sa,
    this.dim,
    this.total,
  );
  //
  @override
  State<StatefulWidget> createState() {
    return _Jour();
  }
}

class _Jour extends State<Jour> {
  //
  HistoriqueController controller = Get.find();
  //
  double prix = 0;
  //
  @override
  void initState() {
    //
    super.initState();
    //
    Timer(const Duration(milliseconds: 100), () {
      //
      load();
    });
    //
    // widget.l.forEach((element) {
    //   //"${d.day}-${d.month}-${d.year}"
    //   if ("${widget.d.day}-${widget.d.month}-${widget.d.year}" ==
    //       "${element['dateDepart']}") {
    //     //
    //     prix += widget.e["prix"];
    //     //
    //     controller.totalX.value = controller.totalX.value + widget.e["prix"];
    //     //
    //     if (widget.d.weekday == 1) {
    //       controller.lundiX.value = controller.lundiX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 2) {
    //       controller.mardiX.value = controller.mardiX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 3) {
    //       controller.mercrediX.value =
    //           controller.mercrediX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 4) {
    //       controller.jeudiX.value = controller.jeudiX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 5) {
    //       controller.vendrediX.value =
    //           controller.vendrediX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 6) {
    //       controller.samediX.value =
    //           controller.samediX.value + widget.e["prix"];
    //     } else if (widget.d.weekday == 7) {
    //       controller.dimancheX.value =
    //           controller.dimancheX.value + widget.e["prix"];
    //     }
    //   }
    // });
    //
  }

  load() async {
    controller.totalX.value = widget.total;
    controller.lundiX.value = widget.lu;
    controller.mardiX.value = widget.ma;
    controller.mercrediX.value = widget.mer;
    controller.jeudiX.value = widget.jeu;
    controller.vendrediX.value = widget.ven;
    controller.samediX.value = widget.sa;
    controller.dimancheX.value = widget.dim;
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    //var d = dt.add(Duration(days: widget.index));
    //"${d.day}-${d.month}-${d.year}"
    //List l = snapshot.data as List;

    //
    //setState(() {});
    //
    return Text(
      "${widget.prix}",
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
    );
  }
}
