import 'package:flutter/material.dart';
import 'package:sharing_app/services/auth.dart';


class User {
  int userID;
  bool loggedIn;
  bool onboarded;
  

  User(
    int id,
  ) {
    this.userID = id;
    this.loggedIn = false;
    this.onboarded = false;
  }

  int getUserID() {
    return userID;
  }

  bool isLoggedIn() {
    return loggedIn;
  }

  bool isOnboarded() {
    return onboarded;
  }

  void login() {
    loggedIn = true;
  }

  Future signUp(data, authService) async {
    final source = data['source'];
    print(source);
    if (source == 'email') {
      final email = data['email'];
      final pass = data['pass'];
      final result = await authService.signUpEmailPass(email, pass);
      if (result == null) return false;
      print(result);
      loggedIn = true;
      return true;
    } else if (source == 'google') {
      final result = await authService.signInGoogle();
      if (result == null) return false;
      loggedIn = true;
      return true;
    } else if (source == 'fb') {
       final result = await authService.signInFaceBook();
       if(result == null) return false;
       loggedIn = true;
       return true;
      
    }else if (source == 'twitter') {
      final result = await authService.signInTwitter();
      if(result == null) return false;
       loggedIn = true;
       return true;
    }
    return false;
  }

  void finishOnboarding() {
    onboarded = true;
  }
}

class UserState extends ChangeNotifier {
  User _currentUser = new User(1);
  AuthService authService = new AuthService();

  Object get currentUser => _currentUser;

  int get currentUserID => _currentUser.getUserID();

  bool get isLoggedIn => _currentUser.isLoggedIn();

  bool get isOnboarded => _currentUser.isOnboarded();

  set currentUser(Object user) {
    _currentUser = user;
    notifyListeners();
  }

  void login() {
    _currentUser.login();
    notifyListeners();
    print('login');
  }

  void signUp(data) async {
    var result = await _currentUser.signUp(data, authService);
    if (result) {
      notifyListeners();
      print('signUp');
    } else {
      print('error');
    }
  }

  void finishOnboarding() {
    _currentUser.finishOnboarding();
    notifyListeners();
  }
}
