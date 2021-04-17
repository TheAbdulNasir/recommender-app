import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/profile/settings/PersonalInformationMain.dart';



class AllProfileOptions extends StatefulWidget {
 
  @override
  _AllProfileOptionsState createState() => _AllProfileOptionsState();
}

class _AllProfileOptionsState extends State<AllProfileOptions> {
  @override
  Widget build(BuildContext context) {
    return Column (
        children: <Widget> [ 
           PersonalInformationMain(),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                print('Logout');
              },
              child: Text('Logout'),
            ),
          ),
        ]
      );
  }
}