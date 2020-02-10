import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/event_model.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:ggj_repair/models/event.dart';
import 'package:provider/provider.dart';

class MonologueContainer extends StatefulWidget {
	@override
	MonologueContainerState createState() => MonologueContainerState();
}
class MonologueContainerState extends State<MonologueContainer> {
  @override
	Widget build(BuildContext context) {
    return Consumer<SceneModel>(
      builder: (context, sceneModel, child) {
        var event = sceneModel.currentEvent;
        if (event.runtimeType == MonologEvent) {
          return Container(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Consumer<EventModel>(
                builder: (context, eventModel, child) {
                  return Text(
                    event.messages[eventModel.progress].text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 18, height: 1.8)
                  );
                },
              )
            )
          ); 
        } else {
          return Container();
        }
      }
    );
  }
}