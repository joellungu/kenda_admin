import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class ItineranceController extends GetxController {
  RxString arrive = "".obs;
  RxString depart = "".obs;
  //
  Requete requete = Requete();
  //
  Future<List> getItinerance(String depart, String arrive) async {
    Response rep = await requete.getE("itinerances/all/$depart/$arrive");
    if (rep.isOk) {
      return rep.body;
    } else {
      return [];
    }
  }
}
