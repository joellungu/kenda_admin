import 'package:get/get.dart';
import 'package:kenda_admin/utils/requetes.dart';

class HistoriqueController extends GetxController with StateMixin<List> {
  getAllCouresHistorique(int moi, int annee) async {
    Requete requete = Requete();
    //
    change([], status: RxStatus.loading());
    String mois = moi < 9 ? "0$moi" : "$moi";
    //
    Response rep = await requete.getE("courses/historique/1/$mois-$annee");
    if (rep.isOk) {
      print(rep.body);
      //
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
    //
  }
}
