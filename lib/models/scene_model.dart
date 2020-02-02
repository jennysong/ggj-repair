import 'package:flutter/foundation.dart';
import 'package:ggj_repair/scene_manager/scene.dart';

class SceneModel extends ChangeNotifier {
  SceneModel({ this.scene });
  Scene scene;
  int eventIndex = 0; 
}