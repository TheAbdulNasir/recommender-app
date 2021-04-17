import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/Body.dart';
import 'package:sharing_app/main_screens/recos/CompactBody.dart';
import 'package:sharing_app/main_screens/recos/EngagementButtons.dart';

class RecoContentView extends StatelessWidget {
  final bool isCompact;

  const RecoContentView({Key key, this.isCompact = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('reco tapped');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color(0xffBAB9B9), width: 0.75),
        ),
        elevation: 0,
        child: Column(
          children: [
            if (isCompact)
              CompactRecoBody(imageHeight: 80)
            else
              RecoBody(imageHeight: 140),
            RecoEngagmentButtons(isCompact: isCompact),
          ],
        ),
      ),
    );
  }
}
