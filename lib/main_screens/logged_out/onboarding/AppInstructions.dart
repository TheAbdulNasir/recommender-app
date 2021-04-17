import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/instructions/dummy_dig.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/instructions/dummy_spaces.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/instructions/instruction_page.dart';

class AppInstructions extends StatefulWidget {
  final PageController controller;
  const AppInstructions({Key key, this.controller}) : super(key: key);

  @override
  _AppInstructionsState createState() => _AppInstructionsState();
}

class _AppInstructionsState extends State<AppInstructions> {
  final _controller = PageController(initialPage: 0);
  double _current = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page != _current) {
        setState(() => _current = _controller.page);
      }
    });
  }

  void _nextPage() {
    widget.controller.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              padding: const EdgeInsets.all(12),
              onPressed: _nextPage,
              child: Text(_current == 2 ? 'NEXT' : 'SKIP'),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              children: [
                InstructionPage(
                  title: 'So, What’s a Dig?',
                  body: DummyDig(),
                  description: 'A Dig is here is filler text where we’ll '
                      'figure out how to explain what a dig is. This text will '
                      'describe a dig.',
                ),
                InstructionPage(
                  title: 'Where Can I Share a Dig?',
                  body: DummySpaces(),
                  description: 'You can share digs to spaces is here is filler '
                      'text where we’ll figure out how to explain where you '
                      'can share a dig. This text will describe where you can '
                      'share a dig and how it works. Your audience can see.',
                ),
                InstructionPage(
                  title: 'How Can I Share a Dig?',
                  body: Image.asset('assets/images/onboarding/shareSS.png'),
                  description: 'You can share digs like you do any other thing '
                      'you send and here is filler text where we’ll figure out '
                      'how to explain where you can share a dig. This text '
                      'will describe where you can share a dig and how it '
                      'works. Your audience can see.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: DotsIndicator(
              dotsCount: 3,
              position: _current,
              onTap: (position) {
                _controller.animateToPage(
                  position.toInt(),
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
