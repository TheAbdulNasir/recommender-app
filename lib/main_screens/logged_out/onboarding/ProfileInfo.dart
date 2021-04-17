import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/forms/ProfileForm.dart';

class ProfileInfo extends StatelessWidget {
  final PageController controller;
  const ProfileInfo({Key key, this.controller}) : super(key: key);

  void _nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Congrats on being invited to JuhDig!',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Before you get started, we just need to know a few things about you',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          ),
        ),
        ProfileOnboardForm(nextPage: _nextPage),
      ],
    );
  }
}
