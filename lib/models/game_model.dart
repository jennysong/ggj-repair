import 'package:flutter/foundation.dart';

class GameModel extends ChangeNotifier {
  String _currentSceneId;
  String get currentSceneId => _currentSceneId;
  void setSceneId(String sceneId) {
    _currentSceneId = sceneId;
    notifyListeners();
  }
}