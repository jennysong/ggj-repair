import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ggj_repair/app.dart';
import 'package:ggj_repair/models/game_model.dart';
import 'package:ggj_repair/models/character_model.dart';

void main() {
	runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            var gameModel = GameModel();
            gameModel.setScene('testing');
            return gameModel;
          }
        ),
        ChangeNotifierProvider(
          create: (context) => CharacterModel()
        ),
      ],
      child: MyApp(title: 'GGJ_REPAIR')
    )
	);
}