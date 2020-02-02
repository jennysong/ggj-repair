import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/BackgroundContainer.dart';
import 'package:ggj_repair/containers/PictureContainer.dart';
import 'package:ggj_repair/containers/WritingContainer.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:ggj_repair/scene_manager/scene.dart';
import 'package:provider/provider.dart';

class SceneContainer extends StatelessWidget {
  SceneContainer({ this.scene });
  
  final Scene scene;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SceneModel(scene: scene),
      child: Stack(children: <Widget> [
        BackgroundContainer(), // container1:background
        PictureContainer(), // container2:picture 
        WritingContainer(), // container3:writing
      ])
    );
  }
}
