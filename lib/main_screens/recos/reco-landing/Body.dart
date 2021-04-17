import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/content_control/ImageDialog.dart';
import 'package:sharing_app/main_screens/recos/content_control/WebView.dart';


class SingleRecoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(  
      children: [ 
        Align( 
            alignment: Alignment.topCenter,
            child: new GestureDetector(
               onTap: () async {
              await showDialog(
                context: context,
                builder: (_) => RecoWebViewDialog()
              );
            },
            child: new Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width ,
            decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
    
            image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(
            "https://static.independent.co.uk/2020/12/02/20/sashaobama.jpg?width=1200")),
              ),
            )),
          ),
      
          new Align (
            alignment: Alignment.topCenter,
            child:   new Container(  
            //height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width *.80,
            decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
       
              ),
            child: new  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
              "Sasha Obama Goes In!!!",
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          )
      ]
    );
      
  }
}

