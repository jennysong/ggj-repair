import 'package:flutter/foundation.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:ggj_repair/scene_initializer.dart';
import 'package:ggj_repair/scene_manager/scene.dart';

class GameModel extends ChangeNotifier {
  Scene _currentScene;
  String _currentSceneId;
  
  String get currentSceneId => _currentSceneId;
  Scene get currentScene => _currentScene;
  SceneModel currentSceneModel;
  
  Future<void> loadScene(String sceneId) async {
    _currentSceneId = sceneId;
    _currentScene = await SceneInitializer.loadScene(sceneId);
    currentSceneModel = SceneModel();
    currentSceneModel.setScene(currentScene);
    notifyListeners();
  }
}