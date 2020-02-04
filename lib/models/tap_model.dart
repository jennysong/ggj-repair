import 'package:flutter/foundation.dart';

class TapModel extends ChangeNotifier {
  int index = 0;

  void tapInit() {
    index = 0;
    notifyListeners();
  }
  void pageTapped() {
    index++;
    notifyListeners();
  }
}