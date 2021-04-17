import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharing_app/main_screens/dms/dm_individual_main.dart';
import 'package:sharing_app/main_screens/dms/dms_all.dart';
import 'package:sharing_app/main_screens/profile/Boards.dart';
import 'package:sharing_app/main_screens/profile/Recent.dart';
import 'package:sharing_app/main_screens/profile/settings/ProfileSettingsView.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onBack;
  final userID;
  const ProfileScreen({Key key, this.onBack, this.userID}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _subscribe() {
    print('subscribe');
  }

  void _goToMessages() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DMAllMain()),
    );
  }

  Widget _userAction() {
    if (widget.userID == null) {
      return FlatButton(
        shape: CircleBorder(),
        padding: const EdgeInsets.all(12),
        color: const Color(0xffF2F2F2),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProfileSettingsView(),
          ));
        },
        child: Icon(Icons.settings),
      );
    } else {
      return FlatButton(
        shape: CircleBorder(),
        padding: const EdgeInsets.all(12),
        color: const Color(0xffF2F2F2),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DMIndividualMain(),
          ));
        },
        child: Icon(Icons.message),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        appBar(),
                        header(),
                        tabs(),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                firstTab(),
                secondTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstTab() {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            RecentProfileRecos(),
          ],
        );
      },
    );
  }

  Widget secondTab() {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            ProfileSpaces(),
          ],
        );
      },
    );
  }

  Widget appBar() => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            
            const Spacer(),
            _userAction(),
          ],
        ),
      );

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Column(
        children: [
          CircleAvatar(
            radius: 62,
            backgroundImage: NetworkImage(
              "https://techcommunity.microsoft.com/t5/image/serverpage/image-id/217078i525F6A9EF292601F/image-size/large?v=1.0&px=999",
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Jackson Smith',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '@jacksonnnnn',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Whatttttssss good. I post the best content to stay updated with hip-hop releases',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              '2203 Total Subscribers',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
                onPressed: _goToMessages,
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
    );
  }

  Widget tabs() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: const Color(0xffBCB8B8)),
          ),
        ),
        child: Card(
          elevation: 6,
          color: Theme.of(context).scaffoldBackgroundColor,
          margin: EdgeInsets.zero,
          child: TabBar(
            labelColor: Colors.black,
            indicatorColor: const Color(0xffBCB8B8),
            tabs: [
              Tab(text: 'RECENT DIGS'),
              Tab(text: 'SPACES'),
            ],
          ),
        ),
      );
}
