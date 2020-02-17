import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';

class PictureContainer extends StatelessWidget {
	Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        if (sceneModel.backgroundId == 'none') {
          return Container();
        }  
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/backgrounds/'+sceneModel.backgroundId),
              fit: BoxFit.cover
            )
          )
        );
      }
    );
  }
}