import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/providers/UserProvider.dart';

import 'onboarding_button.dart';

class OnboardingDone extends StatelessWidget {
  final PageController controller;
  const OnboardingDone({Key key, this.controller}) : super(key: key);

  void _previousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void _login(BuildContext context) {
    Provider.of<UserState>(context, listen: false).finishOnboarding();
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
              'Almost Done.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Before you get started, remember to join our Discord group',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
          ),
          const SizedBox(height: 32),
          Image.asset(
            'assets/images/onboarding/discord.png',
            width: 100,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Join the group to this beta launch to meet other creators, give '
              'feedback, share ideas for improvements, and also get more '
              'information on ways to monetize your interests',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Spacer(),
          OnboardingButton(
            text: 'Get Started',
            onPressed: () => _login(context),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
