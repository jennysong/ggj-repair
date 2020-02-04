import 'package:flutter/foundation.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:ggj_repair/resource_initializer.dart';
import 'package:ggj_repair/scene_manager/character.dart';
import 'package:ggj_repair/scene_manager/scene.dart';

class GameModel extends ChangeNotifier {
  Scene currentScene;
  String currentSceneId;
  List<Character> characters;
  SceneModel currentSceneModel;
  
  Future<void> loadScene(String sceneId) async {
    currentSceneId = sceneId;
    currentScene = await SceneInitializer.loadScene('scenes/$sceneId');
    currentSceneModel = SceneModel();
    currentSceneModel.setScene(currentScene);
    notifyListeners();
  }
}