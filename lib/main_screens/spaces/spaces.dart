import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/share_to/dig_or_space.dart';
import 'package:sharing_app/widgets/space_card.dart';

class Spaces extends StatelessWidget {
  final VoidCallback onBack;
  const Spaces({Key key, this.onBack}) : super(key: key);

  void _createSpaceOrDig(context) async {
    await showDialog(context: context, builder: (_) => DigOrSpace());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Your Spaces',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    _createSpaceOrDig(context);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 9 / 16,
                children: <Widget>[
                  SpaceCard(
                    title: 'Rap Interviews',
                    subscribers: 115,
                    thumbnail:
                        'https://images.complex.com/complex/image/upload/c_fill,dpr_auto,f_auto,fl_lossy,g_face,q_auto,w_1280/p8bdn5uwqde1nf9wklaz.png',
                    createdBy: 'BeyondMemes',
                    avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
                  ),
                  SpaceCard(
                    title: 'Top 10 ML Articles',
                    subscribers: 34,
                    thumbnail:
                        'https://cdn.dribbble.com/users/1571442/screenshots/6356637/dribbbble_machinelearning_4x.png?compress=1&resize=400x300',
                    createdBy: 'BeyondMemes',
                    avatarUrl: 'https://i.pravatar.cc/300?u=BeyondMemes',
                  ),
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
                    thumbnail:
                        'https://i.ytimg.com/vi/fq8ZkL3-8Kg/maxresdefault.jpg',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
