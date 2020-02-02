import 'package:flutter/foundation.dart';

class Choice {
  Choice({
    @required this.name,
    this.events,
    this.conditions
  });

  final String name;
  final List<dynamic> events;
  final List<String> conditions;
}