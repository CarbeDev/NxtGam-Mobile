import 'package:mobile_app/network/nxtgam_api.dart';

class NewAccountRepository {
  Future<void> sendUsername(String username) async {
    await NxtGamApi.makeRequest<NxtGamEmptyResponse>(
        requestType: RequestType.put,
        endpoint: "/user",
        requestBody: {"username": username});
  }
}
