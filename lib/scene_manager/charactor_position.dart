
import 'package:flutter/foundation.dart';

class CharactorPosition {
  CharactorPosition({ @required this.charactorId, @required this.direction, this.offsetX, this.offsetY });
  final String charactorId;
  final String direction;
  final double offsetX;
  final double offsetY;
}