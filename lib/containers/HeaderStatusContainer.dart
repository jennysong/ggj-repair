import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/player_model.dart';
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
        imageAsset('lib/assets/icons/heart.png'),
        new Consumer<PlayerModel>(
          builder: (context, character, child) {
            return Text(character.health.toString());
          }
        ),
        Container(width:30),
        imageAsset('lib/assets/icons/coin.png'),
        new Consumer<PlayerModel>(
          builder: (context, character, child) {
            return Text(character.money.toString());
          }
        ),
        Container(width:30),
        imageAsset('lib/assets/icons/caution.png'),
        new Consumer<PlayerModel>(
          builder: (context, character, child) {
            return Text(character.suspicion.toString());
          }
        )
      ]
    );
  } 
}
