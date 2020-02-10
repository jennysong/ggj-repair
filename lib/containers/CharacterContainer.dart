import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:ggj_repair/models/event.dart';
import 'package:provider/provider.dart';

class CharacterContainer extends StatefulWidget {
	@override
	CharacterContainerState createState() => CharacterContainerState();
}
class CharacterContainerState extends State<CharacterContainer> {
  @override
	Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        var event = sceneModel.currentEvent;
        if (event.runtimeType == DialogEvent) {
          return buildCharacters(context);
        } else return Container();
      });
  }

	Widget buildCharacters(BuildContext context) {
    return Center();
  }
}