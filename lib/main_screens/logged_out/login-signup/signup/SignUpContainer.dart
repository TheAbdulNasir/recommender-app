import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/login/LoginContainer.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/signup/sign_up_buttons/buttons.dart';

class SignUpContainer extends StatelessWidget {
  void _login(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginContainer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Fills the top with the proper color when bouncing
                Expanded(
                  flex: 2,
                  child: Container(color: Color(0xffFAF8F5)),
                ),
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.white),
                ),
              ],
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: LoginAppOverview(),
                  // ),
                  Container(
                    color: Color(0xffFAF8F5),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset('assets/images/authCurves.png'),
                        Container(
                          margin: const EdgeInsets.only(bottom: 92),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 32, 24, 12),
                                child: Text(
                                  'JuhDig',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 48,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 48),
                                child: Hero(
                                  tag: 'AuthLady',
                                  child: Image.asset('assets/images/lady.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    child: Text(
                      'Welcome to JuhDig',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(child: SignUpButtons()),
                  ),
                  GestureDetector(
                    onTap: () => _login(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'ALREADY HAVE AN ACCOUNT? ',
                          style: TextStyle(color: Color(0xffA1A4B2)),
                          children: [
                            TextSpan(
                              text: 'LOG IN',
                              style: TextStyle(color: Color(0xff0D0D0F)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
