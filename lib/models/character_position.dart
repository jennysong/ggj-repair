
import 'package:flutter/foundation.dart';

class CharacterPosition {
  CharacterPosition({
    @required this.characterId,
    @required this.direction,
    position,
    this.offsetX,
    this.offsetY
  }) {
    switch (position) {
      case 'left': {
        this.offsetX = 1;
        this.offsetY = 1;
      }
      break;
      case 'right': {
        this.offsetX = 100;
        this.offsetY = 100;
      }
      break;
    }
  }
  String characterId;
  String direction;
  double offsetX;
  double offsetY;

  String getLink() {
    return this.characterId;
  }
}