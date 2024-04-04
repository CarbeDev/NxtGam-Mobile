import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_app/login/login_repository.dart';

class LoginState {
  Future<bool> loginWithGoogle() async {
    GoogleSignIn googleSignIn;

    if (Platform.isAndroid) {
      String? serverClientId =
          const String.fromEnvironment("google_server_client_id");

      if (serverClientId.isEmpty) {
        print("google server client id is missing");
        return false;
      }

      googleSignIn =
          GoogleSignIn(serverClientId: "SERVER_CLIENT_ID", scopes: ['email']);
    } else {
      throw UnimplementedError(
          "Not implemented for ${Platform.operatingSystem}");
    }

    if (googleSignIn.currentUser != null) {
      googleSignIn.disconnect();
    }

    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account == null) {
      print("Google sign in was aborted"); //Use log
      return false;
    }

    String? authCode = account.serverAuthCode;

    if (authCode == null) {
      print("No server code returned by Google sign in"); //Use log
      return false;
    }

    return LoginRepository.loginWithGoogle(authCode);
  }
}
