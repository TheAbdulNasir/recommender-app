import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/ContentView.dart';

class RecentProfileRecos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RecoContentView(isCompact: false),
          ),
          childCount: 5,
        ),
      ),
    );
  }
}
