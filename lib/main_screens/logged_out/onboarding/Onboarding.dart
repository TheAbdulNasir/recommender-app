import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/AppInstructions.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/ProfileInfo.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/monetization.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/onboarding_done.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/value_prop.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/welcome_screen.dart';

class Onboarding extends StatelessWidget {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.page != 0) {
          _controller.previousPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProfileInfo(controller: _controller),
              WelcomeScreen(controller: _controller),
              // FriendsConnect(controller: _controller),
              AppInstructions(controller: _controller),
              ValueProp(controller: _controller),
              Monetization(controller: _controller),
              OnboardingDone(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
