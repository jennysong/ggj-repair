import 'package:flutter/material.dart';
import 'package:ggj_repair/provider_models/scene_model.dart';
import 'package:provider/provider.dart';
import 'package:ggj_repair/game_page.dart';
import 'package:ggj_repair/title_page.dart';
import 'package:ggj_repair/about_page.dart';
import 'package:ggj_repair/provider_models/player_model.dart';

void main() {
	runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlayerModel()
        ),
        ChangeNotifierProvider(
          create: (context) => SceneModel()
        )
      ],
      child: MyApp(title: 'GGJ_REPAIR')
    )
	);
}

class MyApp extends StatelessWidget {
	final String title;
	MyApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/gamePage',
      routes: {
        '/titlePage': (BuildContext context) => TitlePage(),
        '/gamePage': (BuildContext context) => GamePage(),
        '/aboutPage': (BuildContext context) => AboutPage()
      }
    );
  }
}