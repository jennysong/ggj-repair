import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: AboutContainer()
      )
    );
  }
}

class AboutContainer extends StatefulWidget {
	@override
	AboutContainerState createState() => AboutContainerState();
}  

class AboutContainerState extends State<AboutContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex:2,
          child: Container()
        ),
        Expanded(
          flex:1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Team Blink',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.underline
                ),
              ),
              Text(
                'Inhye Choi',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Jenny Song',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Jimmy Kim',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Shawn Jung',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ]
          )
        ),
        Expanded(
          flex:2,
          child: Padding(
            padding: const EdgeInsets.only(top: 205.0),
            // top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/titlePage');
              },
              child: Text(
                'BACK',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white
                )
              )
            )
          )
        )
      ]
    );
  }
}