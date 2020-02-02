import 'package:flutter/foundation.dart';

class Message {
  Message({
    @required this.text,
    this.conditions
  });

  final String text;
  final List<String> conditions;
}