import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';

class InterfaceContainer extends StatefulWidget {
	@override
	InterfaceContainerState createState() => InterfaceContainerState();
}  

class InterfaceContainerState extends State<InterfaceContainer> {
	bool expandBox = false;
  bool itemBoxOnTop = true;
	@override
	Widget build(BuildContext context) {
		return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Provider.of<SceneModel>(context, listen: false).next();
            },
          )
        ),
				Row (
          children: <Widget>[
            GestureDetector( //itemBox
              onTap: () {
                setState((){
                  expandBox = !expandBox? true : !itemBoxOnTop? true : false;
                  itemBoxOnTop = true;
                });
              },
              child: bottomTabContainer('itemBox')
            ),
            GestureDetector( //MapBox
              onTap: () {
                setState((){
                  expandBox = !expandBox? true : itemBoxOnTop? true : false;
                  itemBoxOnTop = false;
                });
              },
              child: bottomTabContainer('mapBox')
            ),
          ],
        ),
        IndexedStack(
          index: itemBoxOnTop? 0:1,
          children: <Widget>[
            AnimatedContainer(
              color: Color.fromRGBO(63, 152, 172, 1),
              height: expandBox? 270:0,
              duration: Duration(milliseconds:400)
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                color: Color.fromRGBO(169, 134, 95, 1),
                image: DecorationImage(
                  image: AssetImage('lib/assets/backgrounds/map.jpg'),
                  fit: BoxFit.contain
                )
              ),
              height: expandBox? 270:0,
              duration: Duration(milliseconds:400)
            )
          ]
        )
      ]
    );
  }
}

bottomTabContainer(String boxType) => Container(
  height: 50,
  width: 100,
  padding: EdgeInsets.all(30),
  decoration: new BoxDecoration(
    color: boxType == 'itemBox'? Color.fromRGBO(63, 152, 172, 1) : Color.fromRGBO(169, 134, 95, 1),
    image: DecorationImage(
      image: boxType == 'itemBox'? AssetImage('lib/assets/icons/bag.png') : AssetImage('lib/assets/icons/house.png'),
      fit: BoxFit.contain
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 20,
        spreadRadius: 5,
        offset: Offset(6,10)
      )
    ],
    borderRadius: new BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15)
    )
  )
);