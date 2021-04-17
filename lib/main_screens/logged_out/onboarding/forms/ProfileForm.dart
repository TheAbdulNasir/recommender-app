import 'package:flutter/material.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/onboarding_button.dart';

// Create a Form widget.
class ProfileOnboardForm extends StatefulWidget {
  final nextPage;
  const ProfileOnboardForm({Key key, this.nextPage}) : super(key: key);

  @override
  ProfileOnboardFormState createState() => ProfileOnboardFormState();
}

// Create a corresponding State class.
// This class holds data related to the form.
class ProfileOnboardFormState extends State<ProfileOnboardForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/onboarding/invitation.png'),
                ),
              ),
              alignment: Alignment.bottomRight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Icon(Icons.add_circle, size: 26),
              ),
            ),
          ),
          label('First Name'),
          TextFormField(
            decoration: inputDecoration(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter First Name';
              }
              return null;
            },
          ),
          label('Last Name'),
          TextFormField(
            decoration: inputDecoration(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Last Name';
              }
              return null;
            },
          ),
          label('Username'),
          TextFormField(
            decoration: inputDecoration(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter username';
              }
              return null;
            },
          ),
          label('Birthday'),
          TextFormField(
            decoration: inputDecoration(
              Icon(Icons.cake, color: Colors.black, size: 24),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your birthday';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          OnboardingButton(onPressed: widget.nextPage, text: 'Next'),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  InputDecoration inputDecoration([Widget suffix]) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      filled: true,
      fillColor: const Color(0xffEFEEEE),
      isDense: true,
      suffixIcon: suffix,
    );
  }
}
