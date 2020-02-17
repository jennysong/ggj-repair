import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';

class BackgroundContainer extends StatelessWidget {

	Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        if (sceneModel.backgroundColor == null) {
          return Container();
        } else return Container(
          color: sceneModel.backgroundColor
        );
      }
    );
  }
}