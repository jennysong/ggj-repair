import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ggj_repair/models/scene.dart';
import 'package:ggj_repair/models/event.dart';
import 'package:ggj_repair/utils/json_loader.dart';

class SceneModel extends ChangeNotifier {
  String currentSceneId;
  Scene currentScene;
  int _currentEventIndex;
  int eventProgress = 0;

  Color _backgroundColor;
  String _backgroundId;

  Future<void> loadScene(String sceneId) async {
    currentSceneId = sceneId;
    dynamic json = await JsonLoader.load('scenes/$sceneId');
    currentScene = Scene.fromJson(json);
    setCurrentEventIndex(0);
    notifyListeners();
  }

  void next() {
    if(currentEvent != null && isNextActionAvailable()) {
      eventProgress++;
      notifyListeners();
    } else if(isNextEventAvailable) {
      setCurrentEventIndex(_currentEventIndex + 1);
      notifyListeners();
    }
  }

  void setCurrentEventIndex(int index) {
    print('event $index');
    _currentEventIndex = index;
    eventProgress = 0;
  }

  dynamic get currentEvent => currentScene != null ? currentScene.events[_currentEventIndex] : null;
  dynamic get backgroundColor =>
    isBackgroundColorChangeable ?
      _backgroundColor = _colorPicker(currentEvent.backgroundColor) :
      _backgroundColor;

  dynamic get backgroundId =>
    isBackgroundIdChangeable ?
      _backgroundId = currentEvent.backgroundId :
      _backgroundId;

  bool get isBackgroundColorChangeable => _backgroundColor == null || (isEventWithBackgroundItems && currentEvent.backgroundColor != null);
  bool get isBackgroundIdChangeable => _backgroundId == null || (isEventWithBackgroundItems && currentEvent.backgroundId != null);
  bool get isEventWithBackgroundItems => currentEvent.runtimeType == DialogEvent || currentEvent.runtimeType == MonologEvent;
  bool get isNextEventAvailable => currentScene.events.length > _currentEventIndex + 1;

  bool isNextActionAvailable() {
    switch(currentEvent.runtimeType) {
      case DialogEvent: {
        return currentEvent.conversations.length > eventProgress + 1;
      }
      break;
      case MonologEvent: {
        return currentEvent.messages.length > eventProgress + 1;
      }
      break;
      default: {
        return false;
      }
    }
  }
}

Color _colorPicker(backgroundColor) {
  switch(backgroundColor) {
    case 'empty': {
      return null;
    }
    case 'white': {
      return Colors.white;
    }
    break;
    case 'black': {
      return Colors.black;
    }
    break;
    case 'yellow': {
      return Colors.yellow;
    }
    break;
    case 'blue': {
      return Colors.blue;
    }
    break;
    default: {
      return Colors.black;
    }
  }
}