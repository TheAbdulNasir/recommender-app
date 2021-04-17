import 'package:flutter/material.dart';
import 'package:sharing_app/widgets/space_card.dart';

class AllSpaces extends StatefulWidget {
  @override
  _AllSpacesState createState() => _AllSpacesState();
}

class _AllSpacesState extends State<AllSpaces> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 9 / 16,
      children: <Widget>[
        SpaceCard(
          title: 'Jay Z Weird Faces',
          subscribers: 570,
          thumbnail:
              'https://i.pinimg.com/originals/bb/ec/45/bbec45f44f5314595f4d9d5992dbe974.jpg',
          createdBy: 'SomeoneElse',
          avatarUrl: 'https://i.pravatar.cc/300?u=SomeoneElse',
        ),
        SpaceCard(
          title: 'Euphoria Vibes',
          subscribers: 570,
          thumbnail: 'https://i.ytimg.com/vi/fq8ZkL3-8Kg/maxresdefault.jpg',
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
        ),
        SpaceCard(
          title: 'Memessss',
          subscribers: 570,
          thumbnail:
              'https://pyxis.nymag.com/v1/imgs/f22/cee/18a5c624814d1fee69692841d2f92e89ad-21-homer-bushes-lede.rhorizontal.w700.jpg',
          createdBy: 'ItsaMeeMariooo',
          avatarUrl: 'https://i.pravatar.cc/300?u=ItsaMeeMariooo',
        ),
        SpaceCard(
          title: 'Best Among Us Tutorials',
          subscribers: 570,
          thumbnail:
              'https://cnet3.cbsistatic.com/img/C_J1PUATAExNP3p1z2e0x083KEk=/0x154:1000x778/1200x675/2020/10/21/9f706d3a-dc30-4937-8195-47aa345288e5/promofinal.jpg',
          createdBy: 'BeyondMemes',
          avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
        ),
      ],
    );
  }
}
