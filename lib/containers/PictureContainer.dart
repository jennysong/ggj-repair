import 'package:flutter/material.dart';

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
