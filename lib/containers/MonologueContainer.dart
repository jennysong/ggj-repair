import 'package:flutter/material.dart';
import 'package:ggj_repair/models/game_model.dart';
import 'package:ggj_repair/models/tap_model.dart';
import 'package:ggj_repair/scene_manager/scene.dart';
import 'package:provider/provider.dart';

class MonologueContainer extends StatefulWidget {
	@override
	MonologueContainerState createState() => MonologueContainerState();
}
class MonologueContainerState extends State<MonologueContainer> {
  @override
	Widget build(BuildContext context) {
    // Provider.of<TapModel>(context).tapInit();
    return new Consumer<TapModel>(
      builder: (context, tapModel, child) {
        return new Consumer<GameModel>(
          builder: (context, gameModel, child) {
            Scene scene = gameModel.currentScene;
            dynamic event = scene.events[1];
            int maxIndex = event.messages.length;
            if (tapModel.index < maxIndex) {
              return Container(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    '${event.messages[tapModel.index].text}',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 18, height: 1.8)
                  )
                )
              );
            } else {
              debugPrint('move to next scene');
              tapModel.index = 0;
              return Container();
            }
          }
        );
      }
    );
  }
}


// Provider.of<TapModel>(context).tapInit(); call this before.