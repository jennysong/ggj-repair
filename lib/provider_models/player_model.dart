import 'package:flutter/foundation.dart';

class PlayerModel extends ChangeNotifier {
  int health = 100;
  int suspicion = 0;
  int money = 500;
  List<String> items = [];
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

  void addItem(String value) {
    items.add(value);
    notifyListeners();
  }
  
  void removeItem(String value) {
    items.remove(value);
    notifyListeners();
  }

  @override
  String toString() {
    return 'health: $health, suspicion: $suspicion, money: $money, show: $show';
  }
}