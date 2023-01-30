import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade50,
        highlightColor: Colors.grey.shade300,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Item(),
            SizedBox(
              height: 5,
            ),
            Item(),
            SizedBox(
              height: 5,
            ),
            Item(),
          ],
        ),
      ),
    );
  }

  Widget Item() {
    return Container(
      //padding: const EdgeInsets.all(5),
      height: Get.size.height / 3.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              //color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: Get.size.width / 2,
                      height: 20,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: Get.size.width / 1.5,
                      height: 20,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: Get.size.width / 2,
                    height: 20,
                    color: Colors.grey.shade200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: Get.size.width / 1.5,
                    height: 20,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: Get.size.width / 1.2,
                    height: 20,
                    color: Colors.blue.shade200,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: Get.size.width / 2,
                        height: 20, color: Colors.grey.shade200,),
                    ),
                    */
                  //SizedBox(height: 10,),
                  /*
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: Get.size.width / 1.7,
                        height: 20, color: Colors.grey.shade200,),
                    ),
                    */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
