import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/main_screens/recos/reco-landing/single_reco_screen.dart';
import 'package:sharing_app/providers/UserProvider.dart';
import 'package:sharing_app/services/user.dart';

class RecoEngagmentButtons extends StatefulWidget {
  final bool isCompact;

  const RecoEngagmentButtons({Key key, this.isCompact = false})
      : super(key: key);

  @override
  _RecoEngagmentButtonsState createState() => _RecoEngagmentButtonsState();
}

class _RecoEngagmentButtonsState extends State<RecoEngagmentButtons> {
  final _userService = UserService();

  void _tapComment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SingleRecoScreen(),
      ),
    );
  }

  void _tapAdd() {
    print(Provider.of<UserState>(context, listen: false)
        .currentUserID
        .toString());
    print('tapped add to spaces');
  }

  Future _tapLike() async {
    await _userService.getAllUsers();
    print('tapped liked');
  }

  void _tapShare() {
    print('tapped share');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding:
            widget.isCompact ? EdgeInsets.zero : const EdgeInsets.all(4),
        children: <Widget>[
          IconButton(
            onPressed: _tapComment,
            icon: FaIcon(FontAwesomeIcons.commentDots),
          ),
          IconButton(
            onPressed: _tapAdd,
            icon: Icon(Icons.add_circle_outline),
            iconSize: 28,
          ),
          IconButton(
            onPressed: _tapLike,
            icon: FaIcon(FontAwesomeIcons.thumbsUp),
          ),
          IconButton(
            onPressed: _tapShare,
            icon: FaIcon(FontAwesomeIcons.shareSquare),
          ),
        ],
      ),
    );
  }
}
