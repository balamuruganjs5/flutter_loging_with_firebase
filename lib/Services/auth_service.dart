import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async{

    // ? begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // ? Obtain user details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // ? Create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    // ? Finally let's sign in
    await FirebaseAuth.instance.signInWithCredential(credential);

  }
}