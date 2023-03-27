import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class RapportController extends GetxController {
  Requete requete = Requete();
  //

  //
  Future<bool> creerRapport(Map e) async {
    Response rep = await requete.postE("rapports", e);
    if (rep.isOk) {
      Get.back();
      print(rep.body);
      return true;
    } else {
      Get.back();
      print(rep.body);
      return false;
    }
  }

  //
  Future<List> getRapportAgent(String date) async {
    Response rep = await requete.getE("rapports/rapportAgent/1/$date/1234567");
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      print(rep.body);
      return [];
    }
  }
}
