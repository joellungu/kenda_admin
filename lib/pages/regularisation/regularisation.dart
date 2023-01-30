import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Regularisation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Regularisation();
  }

}

class _Regularisation extends State<Regularisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          //showModalBottomSheet(context: context, builder: builder)
          showBottomSheet(context: context, builder: (c){
            return Container(
              height: Get.size.height / 2,
            );
          });
        },
        child: Icon(Icons.edit, color: Colors.white,),
      ),
    );
  }

}
