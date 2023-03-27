import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_admin/pages/course/course_controller.dart';
import 'package:kenda_admin/pages/course/detail.dart';
//import 'nouvelle_course/nouvelle_cours.dart';

class CourseItem extends StatefulWidget {
  Map data;
  CourseItem(this.data) {
    print(DateTime.now());
  }
  @override
  State<StatefulWidget> createState() {
    return _CourseItem();
  }
}

class _CourseItem extends State<CourseItem> {
  double equation() {
    var totalMinute = DateTime.parse(widget.data["heureArrive"])
        .difference(DateTime.parse(widget.data["heureDepart"]))
        .inMinutes;
    var d = 360 / totalMinute;
    var minuteRestante = DateTime.parse(widget.data["heureArrive"])
        .difference(DateTime.now())
        .inMinutes;
    return minuteRestante * d;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //
        Get.to(Detail(widget.data));
        //
      },
      leading: const Icon(
        CupertinoIcons.bus,
        size: 40,
      ),
      // leading: PieChart(
      //   data: PieChartData(Colors.indigo.shade900, equation()),
      //   radius: 17,
      //   //child: Text("Salut"),
      // ),
      //const Icon(CupertinoIcons.doc_append),
      title: Row(
        children: [
          widget.data['status'] == 0
              ? Icon(
                  Icons.timelapse,
                  size: 15,
                  color: Colors.green.shade900,
                )
              : Container(),
          Container(
            alignment: Alignment.center,
            child: Text(
              "${widget.data['troncons']}",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade900,
              ),
            ),
            // color: Colors.green,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   //color: Colors.green,
          //   child: Text(
          //     "/${widget.data['bus']['nom']}",
          //     style: TextStyle(
          //       fontSize: 17,
          //       fontWeight: FontWeight.w900,
          //       color: Colors.grey.shade900,
          //     ),
          //   ),
          // ),
        ],
      ),
      subtitle: RichText(
        text: TextSpan(
          text: "${widget.data['heureDepart']}".replaceAll(" ", "  De  "),
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          children: [
            /*
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 10,
                    right: 10,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              */
            TextSpan(
              text: "\n${widget.data['heureArrive']}".replaceAll(" ", "  à  "),
            )
          ],
        ),
      ),
      /*
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "${widget.data['heureDepart']}",
              style: TextStyle(
                  //fontSize: 17,
                  ),
            ),
            // color: Colors.green,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 10,
              right: 10,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_forward,
                size: 13,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.green,
            child: Text(
              "${widget.data['heureArrive']}",
              style: TextStyle(
                  //fontSize: 17,
                  ),
            ),
          ),
        ],
      ),
      */
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
