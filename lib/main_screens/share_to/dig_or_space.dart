import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/share_to/create_dig.dart';
import 'package:sharing_app/main_screens/share_to/create_space.dart';


class DigOrSpace extends StatefulWidget {
  @override
  _DigOrSpace createState() => new _DigOrSpace();
}

class _DigOrSpace extends State<DigOrSpace> {
  String url = "";

  void _createSpace() async {
    Navigator.pop(context);
        await showDialog(
        context: context,
        builder: (_) => CreateSpace()
      );
  }

  void _createDig(context) async {
      Navigator.pop(context);
        await showDialog(
        context: context,
        builder: (_) => CreateDig()
      );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
             Center(
                      child: ElevatedButton(
                        onPressed: () => {_createSpace()},
                        child: Text('Create Space'),
                      ),
                    ),

                    Center(
                      child: ElevatedButton(
                        onPressed: () => {_createDig(context)},
                        child: Text('Create Dig'),
                      ),
                    ),

          ],
        )
      ),
    );
  }
}