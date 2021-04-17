import 'package:flutter/material.dart';

import 'onboarding_button.dart';

class ValueProp extends StatelessWidget {
  final PageController controller;
  const ValueProp({Key key, this.controller}) : super(key: key);

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
    return SingleChildScrollView(
      child: Padding(
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
                'Okay... Why Should I Use JuhDig',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            const SizedBox(height: 12),
            value(
              'This is the first reason to use JuhDig. This is where we can Explain the first',
              'assets/images/onboarding/people.png',
              1,
            ),
            value(
              'This is the second reason to use JuhDig. This is where we can Explain the first',
              'assets/images/onboarding/hand.png',
              2,
            ),
            value(
              'This is the third reason to use JuhDig. This is where we can Explain the first',
              'assets/images/onboarding/moneyBag.png',
              3,
            ),
            OnboardingButton(text: 'Next', onPressed: _nextPage),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget value(String text, String image, int step) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$step',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            const SizedBox(width: 12),
            Image.asset(image, width: 50, height: 50)
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(48, 8, 48, 32),
          child: Text(
            'JuhDig is the place where you can Discover, Curate, and Share the best of the Web.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
