
import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/share_to/create_space_design/create_space_design.dart';



class CreateSpace extends StatefulWidget {
  @override
  _CreateSpace createState() => new _CreateSpace();
}

class _CreateSpace extends State<CreateSpace> {
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(child: CreateSpaceForm(),)
          ],
        )
      ),
    );
  }
}