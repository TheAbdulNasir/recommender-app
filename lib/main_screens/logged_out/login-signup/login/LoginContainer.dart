import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/login/LoginButtons.dart';

class LoginContainer extends StatelessWidget {
  void _signUp(context) {
    Navigator.pop(context);
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
                                    const EdgeInsets.fromLTRB(64, 32, 64, 4),
                                child: Text(
                                  'Back to Dig?',
                                  textAlign: TextAlign.center,
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
                    child: Center(child: LoginButtons()),
                  ),
                  GestureDetector(
                    onTap: () => _signUp(context),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'NO ACCOUNT? ',
                          style: TextStyle(color: Color(0xffA1A4B2)),
                          children: [
                            TextSpan(
                              text: 'SIGN UP',
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
