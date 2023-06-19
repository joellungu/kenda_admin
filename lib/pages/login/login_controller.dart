import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/pages/accueil/accueil.dart';
import 'package:kenda_admin/pages/accueil/accueil_admin.dart';
import 'package:kenda_admin/utils/requetes.dart';

class LoginController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  loagingAgent(String numero, String mdp) async {
    //
    Response rep = await requete.getE("agents/login/$numero/$mdp");
    if (rep.isOk) {
      print(rep.statusCode);
      print(rep.body);
      box.write(
        "user",
        rep.body,
      );
      //
      Get.back();
      //
      if (rep.body['role'] != 5) {
        //Get.off(Accueil());
        Get.snackbar("Erreur", "Vous n'etes pas autorisé!");
      } else {
        if (rep.body['actif']) {
          Get.off(Accueil());
        } else {
          Get.snackbar("Erreur",
              "Vous n'etes plus actif veuillez contacter vos superieurs.");
        }
      }
      //
    } else {
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      //
      Get.snackbar(
          "Erreur", "Un problème est survenu lors de l'authentification");
      //
    }
  }

  loagingAdmin(String numero, String mdp) async {
    //
    print("partenaires/login/$numero/$mdp");
    Response rep = await requete.getE("partenaires/login/$numero/$mdp");
    if (rep.isOk) {
      print(rep.statusCode);
      print(rep.body);
      box.write(
        "user",
        rep.body,
      );
      //
      Get.back();
      //
      Get.off(AccueilAdmin());
      //
    } else {
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      //
      Get.snackbar(
          "Erreur", "Un problème est survenu lors de l'authentification");
      //
    }
  }
}
