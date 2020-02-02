import 'package:flutter/material.dart';
import 'package:ggj_repair/models/scene_model.dart';
import 'package:provider/provider.dart';

class WritingContainer extends StatefulWidget {
	@override
	WritingContainerState createState() => WritingContainerState();
}
class WritingContainerState extends State<WritingContainer> {
  @override
	Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Consumer<SceneModel>(
      builder: (context, scene, child) {
        return child;
      }, 
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container()
          ),
          Container(
            height: height*0.28,
            width: width*0.97,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "They couldn't live without each other until...",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 18, height: 1.5)
              )
            )
          )
        ]
      )
    );
  }
}