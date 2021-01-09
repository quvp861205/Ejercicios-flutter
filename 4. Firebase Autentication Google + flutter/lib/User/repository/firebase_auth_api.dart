import 'package:firebase_auth/firebase_auth.dart'  as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isSignIn = false;

  // ignore: deprecated_member_use
  Future<auth.User> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    // ignore: deprecated_member_use
    auth.User user = (await _auth.signInWithCredential(auth.GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken))).user;

    return user;
  }

  void signOut() async {
    await _auth.signOut().then((onValue) => print("Sesion cerrada"));
    googleSignIn.signOut();
    print("\n------Sesion firebase y google cerrada------");
  }

}