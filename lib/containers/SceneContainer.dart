import 'package:flutter/material.dart';
import 'package:ggj_repair/containers/BackgroundContainer.dart';
import 'package:ggj_repair/containers/PictureContainer.dart';
import 'package:ggj_repair/containers/CharacterContainer.dart';
import 'package:ggj_repair/containers/MonologueContainer.dart';
import 'package:ggj_repair/containers/WritingContainer.dart';

class SceneContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget> [
        BackgroundContainer(),
        PictureContainer(),
        CharacterContainer(),
        WritingContainer(),
        MonologueContainer()
      ])
    );
  }
}
