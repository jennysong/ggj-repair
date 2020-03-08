import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/HeaderStatusContainer.dart';
import 'package:ggj_repair/containers/InterfaceContainer.dart';
import 'package:ggj_repair/containers/SceneContainer.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SceneModel sceneModel = Provider.of<SceneModel>(context);
    sceneModel.loadScene('testing');
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: HeaderStatusContainer()
        ),
        body: Stack(
          children: <Widget>[
            sceneModel.currentScene != null ? SceneContainer() : Container(),
            InterfaceContainer(), // container4:interface
          ]
        )
      )
    );
  }
}