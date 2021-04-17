import 'package:flutter/material.dart';
import 'package:sharing_app/widgets/space_card.dart';

class PopularSpaces extends StatefulWidget {
  @override
  _PopularSpacesState createState() => _PopularSpacesState();
}

class _PopularSpacesState extends State<PopularSpaces> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 9 / 16,
      children: <Widget>[
        SpaceCard(
          title: 'One Piece Art',
          subscribers: 570,
          thumbnail:
              "https://cdn.vox-cdn.com/thumbor/QmYUW4WDPUe5cakWg1doB00HdBk=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19656977/5986912410_682fed19e2_b.jpg",
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
        ),
        SpaceCard(
          title: 'Fav BTS Albums',
          thumbnail:
              "https://www.gannett-cdn.com/presto/2020/09/02/USAT/230e4ee9-0e0d-4f8e-b32a-85fbe0d3550e-BTS.jpg",
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
          subscribers: 3500,
        ),
      ],
    );
  }
}
