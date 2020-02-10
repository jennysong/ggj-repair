import 'package:flutter/foundation.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:ggj_repair/models/character.dart';
import 'package:ggj_repair/models/scene.dart';
import 'package:ggj_repair/utils/json_loader.dart';

class GameModel extends ChangeNotifier {
  Scene currentScene;
  String currentSceneId;
  List<Character> characters;
  SceneModel currentSceneModel;
  
  Future<void> loadScene(String sceneId) async {
    currentSceneId = sceneId;
    dynamic json = await JsonLoader.load('scenes/$sceneId');
    currentScene = Scene.fromJson(json);
    currentSceneModel = SceneModel();
    currentSceneModel.setScene(currentScene);
    notifyListeners();
  }
}