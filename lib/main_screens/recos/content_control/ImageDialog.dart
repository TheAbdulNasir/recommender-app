import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new NetworkImage(
            "https://static.independent.co.uk/2020/12/02/20/sashaobama.jpg?width=1200"),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}