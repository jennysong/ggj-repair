import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TitleContainer()
    );
  }
}

class TitleContainer extends StatefulWidget {
	@override
	TitleContainerState createState() => TitleContainerState();
}  

class TitleContainerState extends State<TitleContainer> {
  bool openEye = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector (
          onTap: () {
            setState((){
              openEye = openEye? false : true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                image: openEye? AssetImage('lib/assets/backgrounds/eye_open.jpg') : AssetImage('lib/assets/backgrounds/eye_close.jpg'),
                fit: BoxFit.cover,
              ),
              openEye? Container() : Positioned(
                top: 230,
                left: 110, 
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 1000),
                  placeholder: AssetImage('lib/assets/Blinkw.png'),
                  image: AssetImage('lib/assets/Blink.png'),
                )
              )
            ]
          )
        ),
        Positioned(
          top: 600,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/gamePage');
            },
            child: AnimatedDefaultTextStyle(
              style: openEye
                ? TextStyle(
                  color: Colors.black.withOpacity(0))
                : TextStyle(
                  color: Colors.white.withOpacity(1)),
              duration: openEye
                ? Duration(milliseconds: 0)
                : Duration(milliseconds: 1000),
              child: Text(
                'START',
                textDirection: TextDirection.ltr
              )
            )
          )
        ),
        Positioned(
          top: 640,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/aboutPage');
            },
            child: AnimatedDefaultTextStyle(
              style: openEye
                ? TextStyle(
                  color: Colors.black.withOpacity(0))
                : TextStyle(
                  color: Colors.white.withOpacity(1)),
              duration: openEye
                ? Duration(milliseconds: 0)
                : Duration(milliseconds: 1000),
              child: Text(
                'ABOUT',
                textDirection: TextDirection.ltr
              )
            )
          )
        )
      ]
    );
  }
}