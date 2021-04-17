import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/onboarding_button.dart';

class WelcomeScreen extends StatelessWidget {
  final PageController controller;
  const WelcomeScreen({Key key, this.controller}) : super(key: key);

  void _nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    controller.previousPage(
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
            alignment: Alignment.centerLeft,
            child: FlatButton(
              shape: CircleBorder(),
              padding: const EdgeInsets.all(12),
              color: const Color(0xffF2F2F2),
              onPressed: _previousPage,
              child: BackButtonIcon(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Welcome Curtis!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Text(
              'JuhDig is the place where you can Discover, Curate, and Share the best of the Web.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
              child: Image.asset('assets/images/onboarding/welcome.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(48, 12, 48, 22),
            child: Text(
              'Let’s take a quick tour to show you how JuhDig works',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          OnboardingButton(text: 'Take the Tour', onPressed: _nextPage),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
