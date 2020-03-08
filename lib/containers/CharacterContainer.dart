import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:ggj_repair/models/event.dart';
import 'package:provider/provider.dart';

class CharacterContainer extends StatelessWidget {
  @override
	Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        var event = sceneModel.currentEvent;
        if (event.runtimeType == DialogEvent) {
          return buildCharacters(context, event);
        } else return Container();
      });
  }

	Widget buildCharacters(BuildContext context, event) {
    print(event.characterPositions[0].getLink());
    return Stack( 
      children: <Widget>[
        //imageAsset('lib/assets/characters/'+event.characterPositions[0]),
        // imageAsset('lib/assets/characters/'+event.characterPositions[1].characterId)
    ]);
  }

  Widget imageAsset(String imgUrl) => Image(
    image: AssetImage(imgUrl),
    width: 300,
    height: 300
  );
}