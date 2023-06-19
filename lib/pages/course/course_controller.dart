import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';

class CourseController extends GetxController with StateMixin<List> {
  //
  getAllCoures(int jour) async {
    //change([], status: RxStatus.loading());
    Requete requete = Requete();
    //
    var box = GetStorage();
    Map e = box.read("user") ?? {};
    print(e);
    //
    Response rep = await requete.getE("courses/all/${e['idPartenaire']}/$jour");
    print(rep.statusCode);
    print(rep.body);

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
