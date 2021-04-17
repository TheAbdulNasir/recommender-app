import 'package:flutter/material.dart';

import 'onboarding_button.dart';

class Monetization extends StatelessWidget {
  final PageController controller;
  const Monetization({Key key, this.controller}) : super(key: key);

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
            padding: const EdgeInsets.all(24),
            child: Text(
              'Monetization',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/onboarding/moneyBills.png',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'You’ll be able to monetize your audience and here is filler '
              'text where we’ll figure out how to explain how to monetize your '
              'audience. This text will describe  how it works.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Spacer(),
          OnboardingButton(text: 'Next', onPressed: _nextPage),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
