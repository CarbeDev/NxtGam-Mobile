import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  final GoogleSignIn _googleSignIn;

  LoginRepository()
      : _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
            'https://www.googleapis.com/auth/contacts.readonly',
          ],
        );

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
