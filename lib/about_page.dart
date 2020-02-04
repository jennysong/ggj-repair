import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AboutContainer()
    );
  }
}

class AboutContainer extends StatefulWidget {
	@override
	AboutContainerState createState() => AboutContainerState();
}  

class AboutContainerState extends State<AboutContainer> {
  bool openEye = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('About')
    );
  }
}