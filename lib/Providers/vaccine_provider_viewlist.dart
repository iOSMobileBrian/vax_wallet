
import 'package:flutter/foundation.dart';

import '../Models/vaccine_model.dart';

class VaccineProviderViewList extends ChangeNotifier{

  List<VaccineModel> vaccineList = [];

  void addVaccine(VaccineModel vaccine){
    vaccineList.add(vaccine);
    notifyListeners();
  }
  void reorderList(int index){
    VaccineModel vax = vaccineList.elementAt(index);
    vaccineList.add(vax);
    vaccineList.removeAt(index);
    notifyListeners();
  }
}