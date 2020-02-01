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
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello World!')
          ),
          body: BottomBox()
        )
      )
    );
  }
}

class BottomBox extends StatefulWidget {
	@override
	BottomBoxState createState() => BottomBoxState();
}

class BottomBoxState extends State<BottomBox> {
	bool expandBox = false;
	String selectedBox = 'itemBox';
	@override
	Widget build(BuildContext context) {
		return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                child: new StoreConnector<CharacterState, CharacterState> (
                  converter: (store) => store.state,
                  builder: (context, state) {
                    return new Text('Health: ${state.health}, suspicion: ${state.suspicion}, money: ${state.money}');
                  }
                )
              ),
              GestureDetector(
                onTap: () {
                  StoreProvider.of<CharacterState>(context).dispatch(IncrementHealth(10));
                  debugPrint('hi');
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
								color: Colors.yellow,
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
								color: Colors.orange,
								alignment: Alignment.topRight,
								height: 50,
								width: 100,
							)
						),
					]
				),
				AnimatedContainer(
					color: selectedBox=='itemBox'? Colors.yellow : Colors.orange,
					height: expandBox? 300:10,
					duration: expandBox? Duration(milliseconds:400) : Duration(milliseconds:100)
				)
      ]
    );
	}
}


	