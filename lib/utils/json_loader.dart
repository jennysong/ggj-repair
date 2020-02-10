import 'dart:convert';
import 'dart:async' show Future;

import 'package:flutter/services.dart' show rootBundle;

class JsonLoader {
  static Future<dynamic> load(String path) async {
    String jsonString = await rootBundle.loadString('lib/assets/json/$path.json');
    return json.decode(jsonString);
  }
}