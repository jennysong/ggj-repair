import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/BackgroundContainer.dart';
import 'package:ggj_repair/containers/PictureContainer.dart';
import 'package:ggj_repair/containers/CharacterContainer.dart';
import 'package:ggj_repair/containers/MonologueContainer.dart';
import 'package:ggj_repair/containers/WritingContainer.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:ggj_repair/scene_manager/scene.dart';
import 'package:provider/provider.dart';

class SceneContainer extends StatelessWidget {
  SceneContainer({ this.scene });
  
  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        return ChangeNotifierProvider.value(
          value: sceneModel.currentEventModel,
          child: child
        );
      },
      child: Stack(children: <Widget> [
        BackgroundContainer(),
        PictureContainer(),
        CharacterContainer(),
        WritingContainer(),
        MonologueContainer(),
      ])
    );
  }
}
