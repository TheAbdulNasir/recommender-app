import 'package:flutter/material.dart';

import 'chat_bubble_clipper.dart';

class ChatBubble extends StatelessWidget {
  final String body, time;
  final bool isSender;
  final Color bubbleColor, textColor, timeColor;

  const ChatBubble({
    Key key,
    @required this.body,
    @required this.time,
    this.bubbleColor = const Color(0xFFF5F5F5),
    this.textColor = const Color(0xff1B1A57),
    this.timeColor = const Color(0xffA1A1BC),
    this.isSender = false,
  })  : assert(body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.zero,
      child: PhysicalShape(
        clipper: ChatBubbleClipper(isSender: isSender),
        color: bubbleColor,
        shadowColor: Colors.grey.shade200,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(body, style: TextStyle(color: textColor)),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(time, style: TextStyle(color: timeColor)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
