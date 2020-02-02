import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'scene_manager/scene.dart';

class SceneInitializer {
  static Future<Scene> loadScene(fileName) async {
    String jsonString = await loadAsset('lib/assets/json/scenes/$fileName.json');
    Map parsedJson = json.decode(jsonString);
    return Scene.fromJson(parsedJson);
  }

  static Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }

}