import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharing_app/main_screens/logged_out/onboarding/Onboarding.dart';
import 'package:sharing_app/main_screens/logged_out/login-signup/signup/SignUpContainer.dart';
import 'package:sharing_app/main_screens_container.dart';
import 'package:sharing_app/providers/UserProvider.dart';


class MainMiddleMan extends StatelessWidget {

  Widget _isLoggedIn(context){
  bool loggedIn = Provider.of<UserState>(context,listen: true).isLoggedIn;
  bool onboarded = Provider.of<UserState>(context,listen: true).isOnboarded;

  print(loggedIn);
  print(onboarded);
  if(loggedIn && onboarded){
    print('good to go');
    return MainScreensContainer(); 
  }
  else if(loggedIn && !onboarded){
    print('need to onboard');
    return Onboarding();
  }
  return SignUpContainer();
}

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn(context);
  }
}