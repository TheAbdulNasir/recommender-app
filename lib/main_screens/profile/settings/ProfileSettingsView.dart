import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/profile/settings/AllOptions.dart';



class ProfileSettingsView extends StatelessWidget {
  final VoidCallback onBack;
  const ProfileSettingsView ({Key key, this.onBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: onBack),
      ),
      body: ListView (
        children: <Widget> [ 
           AllProfileOptions()
        ]
      )
    );
  }
}