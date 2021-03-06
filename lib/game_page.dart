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
    
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        return AnimatedOpacity(
          opacity: sceneModel.currentScene == null ? 0 : 1,
          duration: Duration(milliseconds: 600),
          child: child
        );
      },
      child: MaterialApp(
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: HeaderStatusContainer()
          ),
          body: Stack(
            children: <Widget>[
              SceneContainer(),
              InterfaceContainer(), // container4:interface
            ]
          )
        )
      ),
    );
  }
}