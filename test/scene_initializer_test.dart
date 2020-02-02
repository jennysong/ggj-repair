// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ggj_repair/scene_initializer.dart';
import 'package:ggj_repair/scene_manager/scene.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('should initialize scene from JSON.', () async {
    Scene scene = await SceneInitializer.loadScene('testing');
    expect(scene, isA<Scene>());
    expect(scene.events.length, 14);
  });
}