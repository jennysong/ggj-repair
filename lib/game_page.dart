import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/HeaderStatusContainer.dart';
import 'package:ggj_repair/containers/InterfaceContainer.dart';
import 'package:ggj_repair/containers/SceneContainer.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SceneModel>(context, listen: false).loadScene('testing');
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: HeaderStatusContainer()
        ),
        body: Stack(
          children: <Widget>[
            Consumer<SceneModel>(
              builder: (context, sceneModel, child) {
                if (sceneModel.currentScene != null) {
                  return SceneContainer();
                } else {
                  return Container();
                }
              }
            ),
            InterfaceContainer(), // container4:interface
          ]
        )
      )
    );
  }
}