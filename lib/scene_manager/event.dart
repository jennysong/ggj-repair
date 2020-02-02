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
    @required this.backgroundColor,
    @required this.charactorPositions,
    @required this.conversations
  });


  final String backgroundId;
  final Colors backgroundColor;
  final List<CharactorPosition> charactorPositions;
  final List<Conversation> conversations;
}

class MonologEvent implements BaseEvent {
  MonologEvent({
    this.backgroundId,
    this.backgroundColor,
    @required this.messages
  });
  
  final String backgroundId;
  final Colors backgroundColor;
  final List<Message> messages;
}

class GetItemEvent implements BaseEvent {
  GetItemEvent({
    this.visible = true,
    this.purchased = false,
    @required this.itemId,
  });
  
  final bool visible;
  final bool purchased;
  final String itemId;
}

class IncreaseHealthEvent implements BaseEvent {
  IncreaseHealthEvent({
    this.visible = true,
    @required this.amount
  });

  final bool visible;
  final int amount;
}

class IncreaseCurrencyEvent implements BaseEvent {
  IncreaseCurrencyEvent({
    this.visible = true,
    @required this.currencyId,
    @required this.amount
  });
  
  final bool visible;
  final String currencyId;
  final int amount;
}

class DecreaseHealthEvent implements BaseEvent {
  DecreaseHealthEvent({
    this.visible = true,
    @required this.amount
  });

  final bool visible;
  final int amount;
}

class DecreaseCurrencyEvent implements BaseEvent {
  DecreaseCurrencyEvent({
    this.visible = true,
    @required this.currencyId,
    @required this.amount
  });
  
  final bool visible;
  final String currencyId;
  final int amount;
}

class SingleSelectEvent implements BaseEvent {
  SingleSelectEvent({
    @required this.choices
  });
  
  final List<Choice> choices;
}

class NavigateEvent implements BaseEvent {
  NavigateEvent({
    this.sceneId,
    this.eventIndex
  });
  
  final String sceneId;
  final int eventIndex;
}

class NullEvent implements BaseEvent {
}