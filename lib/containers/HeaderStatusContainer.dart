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
    return Consumer<PlayerModel>(
      builder: (context, playerModel, child) {
        return Row(
          children: <Widget>[
            imageAsset('lib/assets/icons/heart.png'),
            Text(playerModel.health.toString()),
            Container(width:30),
            imageAsset('lib/assets/icons/coin.png'),
            Text(playerModel.money.toString()),
            Container(width:30),
            imageAsset('lib/assets/icons/caution.png'),
            Text(playerModel.suspicion.toString())
          ]
        );
      }
    );
  } 
}
