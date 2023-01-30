import 'package:get/get.dart';

class ApplicationController extends GetxController with StateMixin<List> {

  getCourses() async {
    //
    change([], status: RxStatus.success());
  }
}