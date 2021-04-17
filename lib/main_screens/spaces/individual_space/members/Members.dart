import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/profile/profile_screen.dart';
import 'package:sharing_app/main_screens/spaces/individual_space/members/SingleMember.dart';

void _goToProfile(context){
   Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(userID: 1,),
                ),
              );
}

class MembersView extends StatefulWidget {
  final VoidCallback onBack;
  const MembersView({Key key, this.onBack}) : super(key: key);

  @override
  _MembersViewState createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.onBack),
      ),
      body: Padding (  
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Column (  
        children: [ 
            new ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _goToProfile(context);
            },
            child: SingleMember()
          );
        })
        ]
      )
    ));
      
  }
}