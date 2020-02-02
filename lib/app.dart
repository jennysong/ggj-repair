import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/HeaderStatusContainer.dart';
import 'package:ggj_repair/containers/InterfaceContainer.dart';
import 'package:ggj_repair/containers/SceneContainer.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:provider/provider.dart';

import 'models/game_model.dart';

class MyApp extends StatelessWidget {
	final String title;
	MyApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<GameModel>(context, listen: false).loadScene('testing');
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: HeaderStatusContainer()
        ),
        body: Stack(
          children: <Widget>[
            Consumer<GameModel>(
              builder: (context, gameModel, child) {
                if (gameModel.currentScene != null) {
                  SceneModel sceneModel = Provider.of<SceneModel>(context, listen: false);
                  sceneModel.setScene(gameModel.currentScene);
                  return SceneContainer(scene: gameModel.currentScene);
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