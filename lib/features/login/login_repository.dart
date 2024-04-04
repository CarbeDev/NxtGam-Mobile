import 'package:mobile_app/network/network_manager.dart';

class LoginRepository {
  static const signupPath = "/auth/signup";

  static Future<bool> loginWithGoogle(String authCode) async {
    var result = await NetworkManager.instance.client.post(
      "/auth/signup",
      data: {
        "thirdPartyId": "google",
        "redirectURIInfo": {
          "redirectURIOnProviderDashboard": "",
          "redirectURIQueryParams": {
            "code": authCode,
          },
        },
      },
    );

    return result.statusCode == 200;
  }
}
