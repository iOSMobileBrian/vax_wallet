



import 'package:flutter/foundation.dart';

class IndexProvider extends ChangeNotifier{
  int navIndex = 0;

  void updateIndex(int index ){
    navIndex = index;
    notifyListeners();
  }

}