import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ggj_repair/app.dart';
import 'package:ggj_repair/models/models.dart';
import 'package:ggj_repair/reducers/reducer.dart';


enum Actions { Increment }

void main() {
	final store = new Store<CharacterState>(appReducer, initialState: CharacterState.init());
	runApp(new MyApp(
		title: 'GGJ_REPAIR',
		store: store
	));
}