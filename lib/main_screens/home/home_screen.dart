import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/home/TimelineContainer.dart';

class HomeScreen extends StatelessWidget {
  // final topBar = new AppBar(
  //   backgroundColor: new Color(0xfff8faf8),
  //   centerTitle: true,
  //   elevation: 1.0,
  //   title: SizedBox(
  //     height: 35.0,
  //     child: Image.asset("assets/images/insta_logo.png"),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: topBar,
      body: SafeArea(child: TimelineContainer()),
    );
  }
}
