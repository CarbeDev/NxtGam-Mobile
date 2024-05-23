import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {

  Future<GoogleSignInAccount?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();
      return account;
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }
}
