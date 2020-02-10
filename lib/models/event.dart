import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'charactor_position.dart';
import 'choice.dart';
import 'conversation.dart';
import 'message.dart';

abstract class BaseEvent {}

class DialogEvent implements BaseEvent {
  DialogEvent({
    @required this.backgroundId,
    @required backgroundColor,
    @required charactorPositions,
    @required conversations
  }) {

    this.backgroundColor = Colors.black;

    this.charactorPositions = charactorPositions.map<CharactorPosition>((attrs) =>
      new CharactorPosition(
        charactorId: attrs['charactor_id'],
        direction: attrs['direction'],
        position: attrs['position']
      )
    ).toList();
    
    this.conversations = conversations.map<Conversation>((attrs) =>
      new Conversation(
        charactorId: attrs['charactorId'],
        emotion: attrs['emotion'],
        messages: attrs['messages'],
      )
    ).toList();
  }

  String backgroundId;
  Color backgroundColor;
  List<CharactorPosition> charactorPositions;
  List<Conversation> conversations;
}

class MonologEvent implements BaseEvent {
  MonologEvent({
    this.backgroundId,
    backgroundColor,
    @required messages
  }) {
    this.backgroundColor = Colors.black;
    this.messages = messages.map<Message>((attrs) =>
      new Message(
        text: attrs['text'],
        conditions: attrs['conditions'].cast<String>(),
      )
    ).toList();
  }
  
  String backgroundId;
  Color backgroundColor;
  List<Message> messages;
}

class GetItemEvent implements BaseEvent {
  GetItemEvent({
    this.visible = true,
    this.purchased = false,
    @required this.itemId,
  });
  
  bool visible;
  bool purchased;
  String itemId;
}

class IncreaseHealthEvent implements BaseEvent {
  IncreaseHealthEvent({
    this.visible = true,
    @required this.amount
  });

  bool visible;
  int amount;
}

class IncreaseCurrencyEvent implements BaseEvent {
  IncreaseCurrencyEvent({
    this.visible = true,
    @required this.currencyId,
    @required this.amount
  });
  
  bool visible;
  String currencyId;
  int amount;
}

class DecreaseHealthEvent implements BaseEvent {
  DecreaseHealthEvent({
    this.visible = true,
    @required this.amount
  });

  bool visible;
  int amount;
}

class DecreaseCurrencyEvent implements BaseEvent {
  DecreaseCurrencyEvent({
    this.visible = true,
    @required this.currencyId,
    @required this.amount
  });
  
  bool visible;
  String currencyId;
  int amount;
}

class SingleSelectEvent implements BaseEvent {
  SingleSelectEvent({
    @required choices
  }) {
    this.choices = choices.map<Choice>((attrs) =>
      new Choice(
        name: attrs['name'],
        events: attrs['events'],
        conditions: attrs['conditions'].cast<String>(),
      )
    ).toList();
  }
  
  List<Choice> choices;
}

class NavigateEvent implements BaseEvent {
  NavigateEvent({
    this.sceneId,
    this.eventIndex
  });
  
  String sceneId;
  int eventIndex;
}

class NullEvent implements BaseEvent {
}