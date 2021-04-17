import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/auth_input.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/auth_input_label.dart';
import 'package:sharing_app/providers/UserProvider.dart';

class LoginButtons extends StatelessWidget {
  void _loginEmail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.white70,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.35),
              ),
              BoxShadow(
                blurRadius: 3,
                color: Color.fromRGBO(255, 255, 255, 0.9),
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(180),
                child: Ink(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: Colors.grey[800],
                  ),
                  child: Icon(Icons.close),
                ),
              ),
              AuthInputLabel(text: 'Email'),
              AuthInput(hintText: 'Your Email'),
              AuthInputLabel(text: 'Password'),
              AuthInput(hintText: 'Your password', obscureText: true),
              SizedBox(height: 16),
              Center(
                child: FlatButton(
                  height: 44,
                  minWidth: 120,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                    side: BorderSide(color: Color(0xff060606)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _login(context);
                  },
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Color(0xff060606),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login(context) {
    Provider.of<UserState>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    const btnStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color(0xff3F414E),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FlatButton(
          height: 52,
          color: Color(0xff0E1A9D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          onPressed: () => _loginEmail(context),
          child: Text(
            'LOGIN WITH EMAIL AND PASSWORD',
            textAlign: TextAlign.center,
            style: btnStyle.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        FlatButton(
          height: 52,
          color: Color(0xff7583CA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          onPressed: () => _login(context),
          child: Row(
            children: [
              Image.asset(
                'assets/images/facebook.png',
                height: 28,
                width: 28,
              ),
              Expanded(
                child: Text(
                  'LOGIN WITH FACEBOOK',
                  textAlign: TextAlign.center,
                  style: btnStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        FlatButton(
          height: 52,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
            side: BorderSide(color: Color(0xffEBEAEC)),
          ),
          onPressed: () => _login(context),
          child: Row(
            children: [
              Image.asset(
                'assets/images/google.png',
                height: 36,
                width: 36,
              ),
              Expanded(
                child: Text(
                  'LOGIN WITH GOOGLE',
                  textAlign: TextAlign.center,
                  style: btnStyle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        FlatButton(
          height: 52,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
            side: BorderSide(color: Color(0xffEBEAEC)),
          ),
          onPressed: () => _login(context),
          child: Row(
            children: [
              Image.asset(
                'assets/images/twitter.png',
                height: 36,
                width: 36,
              ),
              Expanded(
                child: Text(
                  'LOGIN WITH TWITTER',
                  textAlign: TextAlign.center,
                  style: btnStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
