import 'package:flutter/foundation.dart';
import 'package:ggj_repair/provider_models/event_model.dart';
import 'package:ggj_repair/models/scene.dart';

class SceneModel extends ChangeNotifier {
  Scene currentScene;
  EventModel currentEventModel;
  int _currentEventIndex = 0; 

  dynamic get currentEvent => currentScene.events[_currentEventIndex];
  void setScene(Scene scene) {
    currentScene = scene;
    setCurrentEventModel(EventModel(event: currentEvent));
    notifyListeners();
  }
  void setCurrentEvent(int index) {
    print('event $index');
    _currentEventIndex = index;
    setCurrentEventModel(EventModel(event: currentEvent));
    notifyListeners();
  }

  void setCurrentEventModel(EventModel eventModel) {
    print(eventModel);
    currentEventModel = eventModel;
  }

  bool isNextAvailable() {
    return currentScene.events.length > _currentEventIndex + 1;
  }

  void next() {
    if(currentEventModel != null && currentEventModel.isNextAvailable()) {
      currentEventModel.next();
    } else {
      if(isNextAvailable()) 
        setCurrentEvent(_currentEventIndex + 1);
    }
  }
}