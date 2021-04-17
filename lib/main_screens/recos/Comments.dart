import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/recos/SingleComment.dart';

class CommentsView extends StatefulWidget {
  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * .80,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                labelText: 'Leave a Comment',
              ),
            ),
          ),
          new ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('Comment Tapped');
                },
                child: SingleComment(),
              );
            },
          )
        ],
      ),
    );
  }
}
