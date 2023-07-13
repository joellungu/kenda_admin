import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenda_admin/pages/course/course_controller.dart';
import 'package:kenda_admin/pages/course/detail.dart';
import 'package:kenda_admin/widgets/course_item.dart';
import 'historiques/historique.dart';
import 'logo.dart';
import 'nouvelle_course/nouvelle_cours.dart';

class Course extends StatefulWidget {
  bool admin;
  Course(this.admin);

  @override
  State<StatefulWidget> createState() {
    return _Course();
  }
}

class _Course extends State<Course> with SingleTickerProviderStateMixin {
  TabController? controller;
  //
  CourseController courseController = Get.find();
  //
  @override
  void initState() {
    controller = TabController(length: 7, vsync: this);
    super.initState();
    //
    //var box = GetStorage();
    //
    //Map e = box.read("user");
    //
    courseController.getAllCoures(1);
    //
    controller!.addListener(() {
      //print("La valeur: ${controller!.index}");
      courseController.getAllCoures(controller!.index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    //
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
              "Horaire de vos courses",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
            actions: [
              // InkWell(
              //   onTap: () {
              //     //
              //   },
              //   child: Logo(),
              // )
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 30,
                color: Colors.indigo.shade100,
                child: TabBar(
                  controller: controller,
                  isScrollable: false,
                  //labelColor: Colors.white,
                  // onTap: (e) {
                  //   print(e);
                  //   //courseController.getAllCoures();
                  // },
                  indicatorColor: Colors.pink,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                  indicator: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(1)),
                  unselectedLabelStyle: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade200,
                    fontSize: 13,
                  ),
                  labelStyle: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  tabs: const [
                    Tab(
                      text: "Lun",
                    ),
                    Tab(
                      text: "Mar",
                    ),
                    Tab(
                      text: "Mer",
                    ),
                    Tab(
                      text: "Jeu",
                    ),
                    Tab(
                      text: "Ven",
                    ),
                    Tab(
                      text: "Sam",
                    ),
                    Tab(
                      text: "Dim",
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  controller: controller,
                  children: [
                    getHoraire(1),
                    getHoraire(2),
                    getHoraire(3),
                    getHoraire(4),
                    getHoraire(5),
                    getHoraire(6),
                    getHoraire(7),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              FloatingActionButton(
                tooltip: "",
                heroTag: "logo",
                onPressed: () {
                  //  Get.to(Historique());
                },
                backgroundColor: Colors.indigo.shade900,
                child: Logo(),
              ),
              const SizedBox(
                height: 10,
              ),
              widget.admin
                  ? FloatingActionButton(
                      tooltip: "",
                      heroTag: "history",
                      onPressed: () {
                        Get.to(Historique());
                      },
                      backgroundColor: Colors.indigo.shade900,
                      child: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                tooltip: "",
                heroTag: "add",
                onPressed: () {
                  Get.to(NouvelleCours());
                },
                backgroundColor: Colors.indigo.shade900,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHoraire(int jour) {
    return courseController.obx(
      (state) {
        List l = state!;
        return ListView(
          padding: EdgeInsets.all(10),
          children: List.generate(
            l.length,
            (index) {
              Map e = l[index];
              return CourseItem(e);
            },
          ),
        );
      },
      onEmpty: Container(),
      onLoading: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
