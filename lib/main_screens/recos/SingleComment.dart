import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleComment extends StatefulWidget {
  @override
  _SingleCommentState createState() => _SingleCommentState();
}

class _SingleCommentState extends State<SingleComment> {
  void _tapLike() {
    print("tap like");
  }

  void _tapDislike() {
    print("tap dislike");
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,

      decoration: new BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              width: 10.0,
            ),
            new SizedBox(
              width: 40.0,
            ),
            Expanded(
              child: new Text('Name of Commenter'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 40.0,
              width: 40.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://i.redd.it/8603ud3h9sf31.jpg")),
              ),
            ),
            new SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: new Text('Sample Comment'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              width: 10.0,
            ),
            new SizedBox(
              width: 40.0,
            ),
            GestureDetector(
                onTap: () {
                  _tapLike();
                },
                child: new Icon(FontAwesomeIcons.heart)),
            new SizedBox(
              width: 20.0,
            ),
            GestureDetector(
                onTap: () {
                  _tapDislike();
                },
                child: new Icon(FontAwesomeIcons.thumbsDown)),
          ],
        ),
      ]),
    );
  }
}
