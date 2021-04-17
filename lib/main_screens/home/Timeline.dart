import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/ContentView.dart';
import 'package:sharing_app/main_screens/recos/reco-landing/single_reco_screen.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SingleRecoScreen(),
              ),
            );
          },
          child: RecoContentView(isCompact: false),
        );
      },
    );
  }
}
