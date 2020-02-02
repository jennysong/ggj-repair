import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ggj_repair/models/models.dart';

var header = new StoreConnector<CharacterState, CharacterState> (
  converter: (store) => store.state,
  builder: (context, state) {
    //return new Text('Health: ${state.health}, suspicion: ${state.suspicion}, money: ${state.money}');
    return Center(
      child: Container(
        width: 300,
        child: Row(
          children: <Widget>[
            imageAsset('lib/assets/heart.png'),
            Text('${state.health}'),
            Container(width:50),
            imageAsset('lib/assets/coins.png'),
            Text('${state.money}'),
            Container(width:50),
            imageAsset('lib/assets/warning.png'),
            Text('${state.suspicion}')
          ]
        )
      )
    );
  }
);

imageAsset(String imgUrl) => Image(
  image: AssetImage(imgUrl),
  width: 30,
  height: 30
);
