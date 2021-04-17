
import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/share_to/share_link/share_link.dart';
import 'package:sharing_app/main_screens/share_to/share_pic.dart';


class CreateDig extends StatefulWidget {
  @override
  _CreateDig createState() => new _CreateDig();
}

class _CreateDig extends State<CreateDig> {
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
             Center(
                      child: Text( 
                        'Create Dig'
                      )
                    ),

                      Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Share a Link'),
                      Tab(text: 'Share a Pic'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ShareLink(),
                        SharePic()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )

          ],
        )
      ),
    );
  }
}