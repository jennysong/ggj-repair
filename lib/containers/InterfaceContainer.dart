import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ggj_repair/models/models.dart';
import 'package:ggj_repair/actions/actions.dart';

class InterfaceContainer extends StatefulWidget {
	@override
	InterfaceContainerState createState() => InterfaceContainerState();
}  

class InterfaceContainerState extends State<InterfaceContainer> {
	bool expandBox = false;
  bool quickAnimation = false;
	String selectedBox = 'itemBox';
	@override
	Widget build(BuildContext context) {
		return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  StoreProvider.of<CharacterState>(context).dispatch(IncrementHealth(10));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent
                )
              )
            ]
          )
        ),
				Row(
					children: [
						GestureDetector( //itemBox
							onTap: () {
								setState((){
									if (!expandBox) {
										expandBox = true;
                    quickAnimation = true;
										selectedBox = 'itemBox';
									}	else if (selectedBox != 'itemBox') {
										selectedBox = 'itemBox';
                    quickAnimation = false;
									} else {
										expandBox = false;
                    quickAnimation = false;
									}
								});
							},
							child: bottomTabContainer('itemBox')
						),
						GestureDetector( //mapBox
							onTap: () {
								setState((){
									if (!expandBox) {
										expandBox = true;
										selectedBox = 'mapBox';
                    quickAnimation = true;
									}	else if (selectedBox != 'mapBox') {
										selectedBox = 'mapBox';
                    quickAnimation = false;
									} else {
										expandBox = false;
                    quickAnimation = false;
									}
								});
							},
							child: bottomTabContainer('mapBox')
						),
					]
				),
				AnimatedContainer(
					color: selectedBox=='itemBox'? Colors.teal[900] : Colors.indigo[900],
					height: expandBox? 300:0,
					duration: quickAnimation? Duration(milliseconds:400) : Duration(milliseconds:100)
				)
      ]
    );
	}
}

bottomTabContainer(String boxType) => Container(
  alignment: Alignment.topRight,
  height: 50,
  width: 100,
  padding: EdgeInsets.all(30),
  decoration: new BoxDecoration(
    color: boxType == 'itemBox'? Colors.teal[900] : Colors.indigo[900],
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