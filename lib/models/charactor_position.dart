
import 'package:flutter/foundation.dart';

class CharactorPosition {
  CharactorPosition({
    @required this.charactorId,
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
  String charactorId;
  String direction;
  double offsetX;
  double offsetY;
}