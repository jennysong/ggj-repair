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
    return new Text('Health: ${state.health}, suspicion: ${state.suspicion}, money: ${state.money}');
  }
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
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0.6),
      height: 350,
      alignment: Alignment.bottomCenter
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
                  color: Colors.pink
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
										selectedBox = 'itemBox';
									}	else if (selectedBox != 'itemBox') {
										selectedBox = 'itemBox';
									} else {
										expandBox = false;
									}
								});
							},
							child: Container(
								color: Colors.teal[900],
								alignment: Alignment.topRight,
								height: 50,
								width: 100,
							)
						),
						GestureDetector( //mapBox
							onTap: () {
								setState((){
									if (!expandBox) {
										expandBox = true;
										selectedBox = 'mapBox';
									}	else if (selectedBox != 'mapBox') {
										selectedBox = 'mapBox';
									} else {
										expandBox = false;
									}
								});
							},
							child: Container(
								color: Colors.indigo[900],
								alignment: Alignment.topRight,
								height: 50,
								width: 100,
							)
						),
					]
				),
				AnimatedContainer(
					color: selectedBox=='itemBox'? Colors.teal[900] : Colors.indigo[900],
					height: expandBox? 300:0,
					duration: expandBox? Duration(milliseconds:400) : Duration(milliseconds:100)
				)
      ]
    );
	}
}


	