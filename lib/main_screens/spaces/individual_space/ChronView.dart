import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/ContentView.dart';

class SpaceChronView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RecoContentView(isCompact: false),
          ),
          childCount: 5,
        ),
      ),
    );
  }
}
