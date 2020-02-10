import 'package:flutter/foundation.dart';
import 'package:ggj_repair/models/event.dart';

class EventModel extends ChangeNotifier {
  EventModel({ this.event });
  dynamic event;
  int progress = 0;

  void setProgress(int index) {
    progress = index;
    notifyListeners();
  }

  void next() {
    if(isNextAvailable()) setProgress(progress + 1);
  }

  bool isNextAvailable() {
    switch(event.runtimeType) {
      case DialogEvent: {
        return event.conversations.length > progress + 1;
      }
      break;
      case MonologEvent: {
        return event.messages.length > progress + 1;
      }
      break;
      default: {
        return false;
      }
    }
  }
}