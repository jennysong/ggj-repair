import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/HeaderStatusContainer.dart';
import 'package:ggj_repair/containers/BackgroundContainer.dart';
import 'package:ggj_repair/containers/PictureContainer.dart';
import 'package:ggj_repair/containers/WritingContainer.dart';
import 'package:ggj_repair/containers/InterfaceContainer.dart';

class MyApp extends StatelessWidget {
	final String title;
	MyApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: HeaderStatusContainer()
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
    );
  }
}