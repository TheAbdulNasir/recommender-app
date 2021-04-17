import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter/flutter_twitter.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: 'ZMtDiX3TC5frHJU0iLP9nvFxE',
    consumerSecret: 'lj0rfHc3sgweKcT2lBZjoDu8rL6ChpqJkzNPflTbzHtgEGSXpN',
  );
    // sign in anon 

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

   // sign in email-pass

   Future signUpEmailPass(email,pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future loginEmailPass(email,pass) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in Google

  Future signInGoogle() async{
    try{
       final GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
      final googleAuth = await googleSignInAccount.authentication;
      final googleAuthCred = GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    
      final user = await _auth.signInWithCredential(googleAuthCred);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInFaceBook() async{
    try{
       
      final facebookLogin = FacebookLogin();

      // bool isLoggedIn = await facebookLogin.isLoggedIn;

      final FacebookLoginResult result = await facebookLogin.logIn(['email']);

       String token = result.accessToken.token;

       final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: token);

        final user =  await _auth.signInWithCredential(credential);

      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInTwitter() async{
    try{
       final TwitterLoginResult result = await twitterLogin.authorize();
       
       final AuthCredential credential = TwitterAuthProvider.getCredential(
      authToken: result.session.token, authTokenSecret: result.session.secret);  

      final user = await _auth.signInWithCredential(credential);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}

