import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleMember extends StatefulWidget {

  @override
  _SingleMemberState createState() => _SingleMemberState();
}

class _SingleMemberState extends State<SingleMember> {
  void _goToProfile(){
    print('go to profile');
  }

  void _tapSubscribe(){
    print('subscribe to user');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            
            decoration: new BoxDecoration(
               border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            shape: BoxShape.rectangle,
              ),
            child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(
                        width: 10.0,
                      ),
                      new SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: GestureDetector( 
                      onTap: (){
                        _goToProfile();
                      },
                    child: Text('Member Name'
                      ))
                      ),
                    ],
                  ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new GestureDetector(
                         onTap: (){
                        _goToProfile();
                      },
                        child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://i.redd.it/8603ud3h9sf31.jpg")),
                        ),
                      )),
                      new SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: new Text(
                          '3 Followers'
                        ),
                      ),
                      Row(  
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [ 
                            GestureDetector(
                            onTap: () {
                            _tapSubscribe();
                          },
                          child: new Icon(FontAwesomeIcons.userPlus,
                          color: Colors.black,)
                          ),
                          new SizedBox(
                          width: 10.0,
                          )
                        ],
                      )
                    ],
                  ),
                 
                  ]),
            );
      
  }
}