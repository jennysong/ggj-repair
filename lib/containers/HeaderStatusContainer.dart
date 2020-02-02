import 'package:flutter/material.dart';
import 'package:ggj_repair/models/character_model.dart';
import 'package:provider/provider.dart';

class HeaderStatusContainer extends StatelessWidget {
  Widget imageAsset(String imgUrl) => Image(
    image: AssetImage(imgUrl),
    width: 30,
    height: 30
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        imageAsset('lib/assets/heart.png'),
        new Consumer<CharacterModel>(
          builder: (context, character, child) {
            return Text(character.health.toString());
          }
        ),
        Container(width:30),
        imageAsset('lib/assets/coins.png'),
        new Consumer<CharacterModel>(
          builder: (context, character, child) {
            return Text(character.money.toString());
          }
        ),
        Container(width:30),
        imageAsset('lib/assets/warning.png'),
        new Consumer<CharacterModel>(
          builder: (context, character, child) {
            return Text(character.suspicion.toString());
          }
        )
      ]
    );
  } 
}
