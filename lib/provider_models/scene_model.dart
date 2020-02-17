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
  dynamic currentEvent;

  Color backgroundColor;
  String backgroundId;

  Future<void> loadScene(String sceneId) async {
    currentSceneId = sceneId;
    dynamic json = await JsonLoader.load('scenes/$sceneId');
    currentScene = Scene.fromJson(json);
    setCurrentEvent(0);
    notifyListeners();
  }

  void next() {
    if(currentEvent != null && isNextActionAvailable()) {
      eventProgress++;
      notifyListeners();
    } else if(isNextEventAvailable()) {
      setCurrentEvent(_currentEventIndex + 1);
      notifyListeners();
    }
  }

  void setCurrentEvent(int index) {
    print('event $index');
    _currentEventIndex = index;
    currentEvent = currentScene.events[_currentEventIndex];
    setBackground(currentEvent);
    eventProgress = 0;
  }


  void setBackground(dynamic currentEvent) {
    if (!isEventWithBackgroundItems()) {
      return;
    }
    print(currentEvent.backgroundColor);
    if (currentEvent.backgroundColor != null) {
      backgroundColor = colorPicker(currentEvent.backgroundColor);
    }
    print(currentEvent.backgroundId);
    if (currentEvent.backgroundId != null) {
      print(currentEvent.backgroundId);
      backgroundId = currentEvent.backgroundId;
    }
  }

  bool isEventWithBackgroundItems() {
    if (currentEvent.runtimeType == DialogEvent || currentEvent.runtimeType == MonologEvent) {
      return true;
    }
    return false;
  }

  bool isNextEventAvailable() {
    return currentScene.events.length > _currentEventIndex + 1;
  }

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

colorPicker(backgroundColor) {
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