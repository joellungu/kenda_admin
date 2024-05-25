import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/login/login.dart';
import 'package:kenda_admin/utils/requetes.dart';

class ProfileController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  putData(Map pro) async {
    print("agent/${pro['id']}");
    //
    Response response = await requete.putE("agent/${pro['id']}", pro);
    //
    if (response.isOk) {
      //
      print("Rep: ${response.statusCode}");
      print("Rep: ${response.body}");
      //
      box.write("user", {});
      Get.snackbar("Succès", "Mise à jour éffectué !");
      Get.offAll(Login());
    } else {
      print("Rep: ${response.statusCode}");
      print("Rep: ${response.body}");
      Get.snackbar("Oups", "Un problème est survenu lors de la mise à jour");
    }
  }
}
