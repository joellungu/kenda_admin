import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';

class CourseController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  getAllCoures(int jour) async {
    //change([], status: RxStatus.loading());
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

  setStatus(String id, int valeur, int jour) async {
    //
    Response rep =
        await requete.putE("courses/suspendre/$id?status=$valeur", valeur);
    print(rep.statusCode);
    print(rep.body);

    if (rep.isOk) {
      Get.back();
      Get.back();
      getAllCoures(jour);
      Get.snackbar("Succès", "La mise à jour a été éffectué avec succès");
    } else {
      //
      Get.back();
      Get.snackbar("Oups", "Un problème est survenu lors de la mise à jour.");
    }
  }
}
