import 'package:flutter/foundation.dart';

class TapModel extends ChangeNotifier {
  int index = 10;

  void tapInit() {
    index = 0;
    notifyListeners();
  }
  void pageTapped() {
    index++;
    notifyListeners();
  }
}