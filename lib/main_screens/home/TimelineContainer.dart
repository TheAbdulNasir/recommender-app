import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/home/Timeline.dart';


class TimelineContainer extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child:Timeline())
      ]
    );
  }
}