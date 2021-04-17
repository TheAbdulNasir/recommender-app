import 'package:flutter/material.dart';
import 'package:sharing_app/widgets/space_card.dart';

class RecommendedSpaces extends StatefulWidget {
  @override
  _RecommendedSpacesState createState() => _RecommendedSpacesState();
}

class _RecommendedSpacesState extends State<RecommendedSpaces> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 9 / 16,
      children: <Widget>[
        SpaceCard(
          title: 'Fav SpongeBob Memes',
          subscribers: 150,
          thumbnail:
              'https://ftw.usatoday.com/wp-content/uploads/sites/90/2017/05/spongebob.jpg',
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
        ),
        SpaceCard(
          title: 'Best Gossip Girl Tweets',
          thumbnail:
              'https://fr.web.img5.acsta.net/r_1920_1080/pictures/18/10/31/16/41/2588516.jpg',
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
          subscribers: 1200,
        ),
      ],
    );
  }
}
