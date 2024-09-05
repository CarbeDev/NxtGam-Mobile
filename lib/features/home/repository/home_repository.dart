import 'package:mobile_app/features/home/repository/nxtgam_home_responses.dart';
import 'package:mobile_app/network/nxtgam_api.dart';

class HomeRepository {
  static Future<NxtGameHomeUserResponse> getJoinedLeague() async {
    return await NxtGamApi.makeRequest<NxtGameHomeUserResponse>(
        requestType: RequestType.get, endpoint: "/user");
  }
}
