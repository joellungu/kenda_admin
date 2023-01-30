import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class CourseController extends GetxController with StateMixin<List> {
  //
  getAllCoures() async {
    Requete requete = Requete();
    //
    Response rep = await requete.getE("");
    if (rep.isOk) {
      //
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
    //
  }
}
