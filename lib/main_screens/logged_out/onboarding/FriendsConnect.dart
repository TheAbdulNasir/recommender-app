import 'package:flutter/material.dart';


class FriendsConnect extends StatelessWidget {
  final PageController controller;
  const FriendsConnect({Key key, this.controller}) : super(key: key);
  
   void _nextPage(){
    controller.animateToPage(controller.page.toInt() + 1,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn
    );
  }
   void _lastPage(){
    controller.animateToPage(controller.page.toInt() - 1,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:ListView( 
      children: [
        Column(
          children: [ 
             Text(
          'Friends Connect'
        ),
        ElevatedButton(
                        onPressed: () => {_nextPage()},
                        child: Text('Next Page'),
                      ),
                       ElevatedButton(
                        onPressed: () => {_lastPage()},
                        child: Text('Last Page'),
                      ),
          ],
        )
        
      ],
    ));
  }
}