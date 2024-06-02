import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_app/network/nxtgam_api.dart';

import 'login_responses.dart';

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

  Future<NxtGamLoginResponse> getUserInfo(String userId) async {
    return await NxtGamApi.makeRequest<NxtGamLoginResponse>(
        requestType: RequestType.get, endpoint: "/login");
  }
}
