import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_admin/utils/requetes.dart';

class ItineranceController extends GetxController {
  RxString arrive = "".obs;
  RxString depart = "".obs;
  //
  var box = GetStorage();
  //

  //
  Requete requete = Requete();
  RxSet listeResumer = RxSet(); //box.read("Itinerance") ?? [];
  //
  Future<List> getItinerance(String depart, String arrive) async {
    Map e = box.read("user");
    Response rep = await requete.getE("itinerances/all/$depart/$arrive");
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      return [];
    }
  }

  //
  Future<List> getAllItinerancesSave() async {
    listeResumer.cast();
    Map e = box.read("user");
    Response rep = await requete.getE("itinerances/allsave/${e['id']}");
    if (rep.isOk) {
      print("-----: ${rep.body}");
      return rep.body;
    } else {
      return [];
    }
  }

  Future<List> getTronconsRoute(String nom) async {
    listeResumer.cast();
    Map e = box.read("user");
    Response rep = await requete.getE("itinerances/course/${e['id']}/$nom");
    if (rep.isOk) {
      print("-----: ${rep.body}");
      return rep.body;
    } else {
      return [];
    }
  }

  //
  Future<bool> setItinerance(List it) async {
    Response rep = await requete.postE("itinerances", it);
    print("------: ${rep.body}");
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      return false;
    }
  }

  //
  Future<bool> updateItinerance(List it) async {
    Response rep = await requete.putE("itinerances", it);
    print("------: ${rep.body}");
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      return false;
    }
  }

  //
  Future<bool> deleteItinerance(List it) async {
    Response rep = await requete.putE("itinerances/delete", it);
    print("------: ${rep.body}");
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      return false;
    }
  }
}
