import 'package:flutter/foundation.dart';

class CharacterModel extends ChangeNotifier {
  int health = 100;
  int suspicion = 0;
  int money = 500;
  bool show;

  void increaseHealth(int value) {
    health += value;
    notifyListeners();
  }

  void setHealth(int value) {
    health = value;
    notifyListeners();
  }

  void setSuspicion(int value) {
    suspicion = value;
    notifyListeners();
  }

  void setMoney(int value) {
    money = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'health: $health, suspicion: $suspicion, money: $money, show: $show';
  }
}