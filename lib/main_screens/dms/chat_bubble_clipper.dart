import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  final bool isSender;
  final double radius;

  ChatBubbleClipper({this.isSender = false, this.radius = 12});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(
      RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(radius)),
    );
    final path2 = Path();
    path2.addRRect(RRect.fromLTRBAndCorners(0, 0, radius, radius));
    if (isSender) {
      // Draw the corner on the top right
      path.addPath(path2, Offset(size.width - radius, size.height - radius));
    } else {
      // Draw the corner on the bottom left
      path.addPath(path2, Offset(0, size.height - radius));
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
