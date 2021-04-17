import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharing_app/main_screens/spaces/individual_space/ChronView.dart';
import 'package:sharing_app/main_screens/spaces/individual_space/members/Members.dart';

class IndividualSpace extends StatefulWidget {
  const IndividualSpace({Key key}) : super(key: key);

  @override
  _IndividualSpaceState createState() => _IndividualSpaceState();
}

class _IndividualSpaceState extends State<IndividualSpace> {
  void _subscribe() {
    print('subscribe');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    FlatButton(
                      shape: CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      color: const Color(0xffF2F2F2),
                      onPressed: () => Navigator.maybePop(context),
                      child: BackButtonIcon(),
                    ),
                    const Spacer(),
                    FlatButton(
                      shape: CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      color: const Color(0xffF2F2F2),
                      onPressed: () {},
                      child: Icon(Icons.more_horiz),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 62,
                      backgroundImage: NetworkImage(
                        "https://static.wikia.nocookie.net/enfuturama/images/d/da/Fry_Looking_Squint.jpg/revision/latest/top-crop/width/300/height/300?cb=20110701192358",
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Fav One Piece Art',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('profile name tapped');
                      },
                      child: Text(
                        'creeated by luffyfanboi',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'This space is dedicated to my favorite one piece  art that I find throughout the web.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MembersView(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          '700 Subscribers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1.2),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      onPressed: _subscribe,
                      child: Text(
                        'SUBSCRIBE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.shareSquare),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.envelopeOpenText),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.comment),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: const Color(0xffBCB8B8)),
                  ),
                ),
                child: Card(
                  elevation: 4,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DIGS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // THE DIG IS IN FA PRO
                        FaIcon(FontAwesomeIcons.hammer, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SpaceChronView(),
          ],
        ),
      ),
    );
  }
}
