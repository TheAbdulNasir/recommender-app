import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  final String title;
  final Widget body;
  final String description;

  const InstructionPage({
    Key key,
    @required this.title,
    @required this.body,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: body,
          ),
          const Spacer(),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
