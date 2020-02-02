import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ggj_repair/models/models.dart';
import 'package:ggj_repair/actions/actions.dart';

class MyApp extends StatelessWidget {
	final Store<CharacterState> store;
	final String title;
	MyApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CharacterState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: header
          ),
          body: Stack(
            children: <Widget>[
              BackgroundContainer(), // container1:background
              PictureContainer(), // container2:picture 
              WritingContainer(), // container3:writing
              InterfaceContainer(), // container4:interface
            ]
          )
        )
      )
    );
  }
}

var header = new StoreConnector<CharacterState, CharacterState> (
  converter: (store) => store.state,
  builder: (context, state) {
    //return new Text('Health: ${state.health}, suspicion: ${state.suspicion}, money: ${state.money}');
    return Row(
      children: <Widget>[
        imageAsset('lib/assets/heart.png'),
        Text('${state.health}'),
        Container(width:30),
        imageAsset('lib/assets/coins.png'),
        Text('${state.money}'),
        Container(width:30),
        imageAsset('lib/assets/warning.png'),
        Text('${state.suspicion}')
      ]
    );
  }
);

imageAsset(String imgUrl) => Image(
  image: AssetImage(imgUrl),
  width: 30,
  height: 30
);

/////////////////
class BackgroundContainer extends StatefulWidget {
	@override
	BackgroundContainerState createState() => BackgroundContainerState();
}
class BackgroundContainerState extends State<BackgroundContainer> {
  @override
	Widget build(BuildContext context) {
    return Container(
      color: Colors.black
    );
  }
}
/////////////////
/////////////////
class PictureContainer extends StatefulWidget {
	@override
	PictureContainerState createState() => PictureContainerState();
}
class PictureContainerState extends State<PictureContainer> {
  @override
	Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/backgrounds/Forest_Scene1.jpg'),
          fit: BoxFit.cover
        )
      )
    );
  }
}
/////////////////
/////////////////
class WritingContainer extends StatefulWidget {
	@override
	WritingContainerState createState() => WritingContainerState();
}
class WritingContainerState extends State<WritingContainer> {
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
                "They couldn't live without each other until...",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 18, height: 1.5)
              )
            )
          )
        ]
    );
  }
}
/////////////////
/////////////////
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
