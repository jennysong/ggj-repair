import 'package:flutter/material.dart';

class CharacterContainer extends StatefulWidget {
	@override
	CharacterContainerState createState() => CharacterContainerState();
}
class CharacterContainerState extends State<CharacterContainer> {
  @override
	Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
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
                "nonononono",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 18, height: 1.5)
              )
            )
          )
        ]
    );
  }
}