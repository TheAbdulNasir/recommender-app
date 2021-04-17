import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/auth_input.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/auth_input_label.dart';
import 'package:sharing_app/providers/UserProvider.dart';

class SignUpButtons extends StatelessWidget {
  void _signUpEmail(BuildContext context) {
    var email;
    var password;
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
              AuthInput(hintText: 'Your Email',callback: (emailField){
                email = emailField;
              }),
              AuthInputLabel(text: 'Password'),
              AuthInput(hintText: 'Your password', obscureText: true, callback: (passField){
                password = passField;
              }),
              AuthInputLabel(text: 'Confirm Password'),
              AuthInput(hintText: 'Confirm password', obscureText: true),
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
                    _signUp(context, {
                      'source':'email',
                      'email': email,
                      'pass': password
                    });
                  },
                  child: Text(
                    'SIGN UP',
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

  void _signUp(BuildContext context,data) {
    Provider.of<UserState>(context, listen: false).signUp(data);
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
          onPressed: () => _signUpEmail(context),
          child: Text(
            'SIGN UP WITH EMAIL AND PASSWORD',
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
          onPressed: () => _signUp(context, {
            'source': 'fb'
          }),
          child: Row(
            children: [
              Image.asset(
                'assets/images/facebook.png',
                height: 28,
                width: 28,
              ),
              Expanded(
                child: Text(
                  'SIGN UP WITH FACEBOOK',
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
          onPressed: () => _signUp(context, {
            'source': 'google'
          }),
          child: Row(
            children: [
              Image.asset(
                'assets/images/google.png',
                height: 36,
                width: 36,
              ),
              Expanded(
                child: Text(
                  'SIGN UP WITH GOOGLE',
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
          onPressed: () => _signUp(context,{
            'source': 'twitter'
          }),
          child: Row(
            children: [
              Image.asset(
                'assets/images/twitter.png',
                height: 36,
                width: 36,
              ),
              Expanded(
                child: Text(
                  'SIGN UP WITH TWITTER',
                  textAlign: TextAlign.center,
                  style: btnStyle,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.of(context).push(
        //           MaterialPageRoute(builder: (ctx) => RecieveShareScreen()));
        //     },
        //     child: Text('Recieve share button'),
        //   ),
        // ),
      ],
    );
  }
}
